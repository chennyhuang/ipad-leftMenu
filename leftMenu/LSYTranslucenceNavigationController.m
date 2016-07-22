//
//  LSYTranslucenceNavigationController.m
//  ReaderPlatformUniversal
//
//  Created by 刘思洋 on 15/6/25.
//  Copyright (c) 2015年 刘思洋. All rights reserved.
//

#import "LSYTranslucenceNavigationController.h"
#import <pop/POP.h>
#import <Masonry/Masonry.h>
#import <objc/runtime.h>

@interface LSYTranslucenceNavigationController ()

//容器视图
@property (strong, nonatomic) IBOutlet UIView *containerView;
//背景视图
@property (strong, nonatomic) IBOutlet UIView *backgroundV;

@end

@implementation LSYTranslucenceNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super init];
    if (self) {
        self.viewControllers = [[NSMutableArray alloc] initWithCapacity:1];
        [_viewControllers addObject:rootViewController];
        [self addChildViewController:rootViewController];
        rootViewController.translucenceNavigationController = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.containerView.clipsToBounds = YES;//超出部分不显示
    self.view.frame = [UIScreen mainScreen].bounds;
    //添加退出手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(controllerShouldDisappear)];
    [self.backgroundV addGestureRecognizer:tap];
    [self loadAnimation];
}

#pragma mark - public method

- (void)controllerShouldDisappear
{
    [UIView animateWithDuration:0.3 animations:^{
        _containerView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (!_viewControllers) {
            return;
        }
        
        //逐级释放控制器
        NSArray *arrayVc = [_viewControllers copy];
        for (UIViewController *vc in arrayVc) {
            [vc removeFromParentViewController];
            [vc.view removeFromSuperview];
            [_viewControllers removeObject:vc];//一定要删除数组中存放的控制器，否则不能释放
        }
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}

- (void)pushViewController:(UIViewController *)viewController
{
    UIViewController *currentVC = [_viewControllers lastObject];
    [_viewControllers addObject:viewController];
//    viewController.view.frame = _containerView.bounds;
    self.containerView.clipsToBounds = YES;//超出部分不显示
    

    
    viewController.view.frame = CGRectMake(_containerView.frame.size.width, 0, _containerView.bounds.size.width, _containerView.bounds.size.height);
    
    viewController.translucenceNavigationController = self;
    [self addChildViewController:viewController];
//    UIView *coverView = [[UIView alloc] initWithFrame:_containerView.bounds];
//    coverView.backgroundColor = [UIColor blackColor];
//    coverView.alpha = 0.1;
//    [self.containerView addSubview:coverView];
    [self.containerView addSubview:viewController.view];

    
    [UIView animateWithDuration:0.5 animations:^{
//        coverView.alpha = 0.8;
        currentVC.view.frame = CGRectMake(-_containerView.bounds.size.width, 0, _containerView.bounds.size.width, _containerView.bounds.size.height);
        viewController.view.frame = CGRectMake(0, 0, _containerView.bounds.size.width, _containerView.bounds.size.height);
    } completion:^(BOOL finished) {
        currentVC.view.frame = CGRectMake(0, 0, _containerView.bounds.size.width, _containerView.bounds.size.height);
        [currentVC.view removeFromSuperview];
        [currentVC removeFromParentViewController];
//        [coverView removeFromSuperview];
    }];

}

- (void)popViewController
{
    UIViewController *willRemoveVC = [_viewControllers lastObject];
    [_viewControllers removeLastObject];
    UIViewController *willShowVC = [_viewControllers lastObject];
    [self addChildViewController:willShowVC];
    [self.containerView addSubview:willShowVC.view];
    
    willShowVC.view.frame = CGRectMake(-_containerView.frame.size.width, 0, _containerView.frame.size.width,  _containerView.frame.size.height);
    [UIView animateWithDuration:0.5 animations:^{
        willRemoveVC.view.frame = CGRectMake(_containerView.frame.size.width, 0, _containerView.frame.size.width, _containerView.frame.size.height);
        willShowVC.view.frame = CGRectMake(0, 0, _containerView.frame.size.width,  _containerView.frame.size.height);
    } completion:^(BOOL finished) {
        [willRemoveVC.view removeFromSuperview];
        [willRemoveVC removeFromParentViewController];
    }];  
}

#pragma mark - 

- (void)loadAnimation
{
    //弹簧动画
    UIViewController *rootVC = (UIViewController *)_viewControllers[0];
    rootVC.view.frame = _containerView.bounds;
    [_containerView addSubview:rootVC.view];
//    [rootVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
//    }];

    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0.5, 0.5)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    anim.springBounciness = 16;
    anim.springSpeed = 6;
    [rootVC.view pop_addAnimation:anim forKey:@"scale"];
}

@end

@implementation UIViewController (TranslucenceNavigation)

-(LSYTranslucenceNavigationController *)translucenceNavigationController
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setTranslucenceNavigationController:(LSYTranslucenceNavigationController *)translucenceNavigationController
{
    objc_setAssociatedObject(self, @selector(translucenceNavigationController), translucenceNavigationController, OBJC_ASSOCIATION_RETAIN);
}

@end


