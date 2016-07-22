//
//  LSYDrawerViewController.m
//  ReaderPlatformUniversal
//
//  Created by 刘思洋 on 15/4/28.
//  Copyright (c) 2015年 刘思洋. All rights reserved.
//

#import "LSYDrawerViewController.h"
#import <objc/runtime.h>

#define appWidth   [[UIScreen mainScreen] bounds].size.width
#define appHeight  ([[UIScreen mainScreen] bounds].size.height)
@interface LSYDrawerViewController ()
{
    IBOutlet UIView *_backgroundV;
    UIView *_contentView;
    ContentViewDragDirection _direction;
    
//    CGFloat _contentWidth;
    UIViewController *_viewController;
    IBOutlet UIPanGestureRecognizer *_panGestureRecognizer;
}
@end

@implementation LSYDrawerViewController

- (instancetype)initWithViewController:(UIViewController *)viewController contentWidth:(CGFloat)width
{
    self = [super init];
    if (self) {
        _viewController = viewController;
        viewController.drawerViewController = self;
        _contentWidth = width;
        [self addChildViewController:viewController];
//        [self.view addSubview:viewController.view];
        _dragEnabled = YES;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"drag delloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(appWidth - _contentWidth, 0, _contentWidth, appHeight)];
    _contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_contentView];
    _contentView.transform = CGAffineTransformMakeTranslation(_contentView.frame.size.width, 0);
    [_contentView addSubview:_viewController.view];
    _panGestureRecognizer.enabled = _dragEnabled;
    _viewController.view.frame = _contentView.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - public method

- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window.rootViewController addChildViewController:self];
    [window.rootViewController.view addSubview:self.view];
    self.view.frame = [UIScreen mainScreen].bounds;
    [self setContentViewShow:YES];
}

- (void)dismiss
{
    [self setContentViewShow:NO];
}

- (void)setContentViewTranslation:(CGFloat)translation
{
    _contentView.transform = CGAffineTransformMakeTranslation(translation, 0);
    _backgroundV.alpha = (self.view.frame.size.width - _contentView.frame.origin.x) / _contentView.frame.size.width * 0.7;
}

- (void)setContentViewShow:(BOOL)show
{
    __unsafe_unretained typeof(self) weakSelf = self;
    if (show) {
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf->_contentView.transform = CGAffineTransformMakeTranslation(0, 0);
            weakSelf->_backgroundV.alpha = 0.7;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf->_contentView.transform = CGAffineTransformMakeTranslation(_contentView.frame.size.width, 0);
            weakSelf->_backgroundV.alpha = 0.0;
        }completion:^(BOOL finished) {
            [_viewController removeFromParentViewController];
            [_viewController.view removeFromSuperview];
            if (_viewController) {
                _viewController = nil;//这句话必须写，为了打破循环引用环，让self 以及_viewController能够释放
            }
            [weakSelf.view removeFromSuperview];
            [weakSelf removeFromParentViewController];
            
        }];
    }
}

- (void)contentViewDraggingEndWithDirection:(ContentViewDragDirection)direction
{
    CGFloat dividingLine;
    if (direction == ContentViewDragDirectionLeft) {
        dividingLine = self.view.frame.size.width / 2 + 50 + 100;
    }else{
        dividingLine = self.view.frame.size.width / 2 - 50 + 100;
    }
    CGFloat translationX;
    CGFloat alpha;
    if (_contentView.frame.origin.x <= dividingLine) {
        translationX = 0;
        alpha = 0.7;
    }else{
        translationX = _contentView.frame.size.width;
        alpha = 0.0;
    }
    __unsafe_unretained typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf->_contentView.transform = CGAffineTransformMakeTranslation(translationX, 0);
        weakSelf->_backgroundV.alpha = alpha;
    }completion:^(BOOL finished) {
        if (_backgroundV.alpha < 0.1) {
            [_viewController removeFromParentViewController];
            [_viewController.view removeFromSuperview];
            if (_viewController) {
                _viewController = nil;//这句话必须写，为了打破循环引用环，让self 以及_viewController能够释放
            }
            [weakSelf.view removeFromSuperview];
            [weakSelf removeFromParentViewController];
        }
        
    }];
}

#pragma mark - action method

- (IBAction)backgroundViewTapped:(UITapGestureRecognizer *)sender {
    [self setContentViewShow:NO];
}

- (IBAction)handlePanGestureRecognizer:(UIPanGestureRecognizer *)sender {
    CGPoint translate = [sender translationInView:self.view];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            if (_backgroundV.alpha > 0.5) {
                _direction = ContentViewDragDirectionRight;
            }else{
                _direction = ContentViewDragDirectionLeft;
            }
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            if (translate.x < 0) {
                return;
            }
            [self setContentViewTranslation:translate.x];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            [self contentViewDraggingEndWithDirection:_direction];
        }
            break;
    }
}

#pragma mark - setter & getter 

-(void)setDragEnabled:(BOOL)dragEnabled
{
    _dragEnabled = dragEnabled;
    _panGestureRecognizer.enabled = dragEnabled;
}

@end


@implementation UIViewController (LSYDrawerViewController)

-(LSYDrawerViewController *)drawerViewController
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setDrawerViewController:(LSYDrawerViewController *)drawerViewController
{
    objc_setAssociatedObject(self, @selector(drawerViewController), drawerViewController, OBJC_ASSOCIATION_RETAIN);
}

@end
