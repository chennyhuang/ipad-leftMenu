//
//  HomePageViewController.m
//  leftMenu
//
//  Created by 黄振宇 on 16/7/21.
//  Copyright © 2016年 YunMei. All rights reserved.
//

#import "HomePageViewController.h"
#import "NavigationBarViewController.h"
#import "TestViewController.h"
#import "LSYDrawerViewController.h"


@interface HomePageViewController (){
    LSYDrawerViewController *_drawerVC;
}
- (IBAction)btnClick:(UIButton *)sender;
@property (strong, nonatomic) NavigationBarViewController *navBar;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.titleLabel.text = @"首页";
   
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //这边必须设置frame，否则界面显示有问题
    _navBar.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
//    _drawerVC.view.frame = [UIScreen mainScreen].bounds;
}

- (IBAction)btnClick:(UIButton *)sender {

    TestViewController * vc = [[TestViewController alloc] init];
    LSYDrawerViewController *drawerVC = [[LSYDrawerViewController alloc] initWithViewController:vc contentWidth:self.view.frame.size.width];
    _drawerVC = drawerVC;
    drawerVC.dragEnabled = YES;
    [drawerVC show];
    
//    [self.navigationController pushViewController:vc animated:YES];
    
}

-(NavigationBarViewController *)navBar
{
    if (!_navBar) {
        //添加自定义导航栏
        self.navBar = [[NavigationBarViewController alloc] init];
        _navBar.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
        _navBar.view.backgroundColor = [UIColor redColor];
        _navBar.titleLabel.textColor = [UIColor whiteColor];
        _navBar.titleLabel.font = [UIFont systemFontOfSize:20];
        [self addChildViewController:_navBar];
        [self.view addSubview:_navBar.view];
    }
    return _navBar;
}

- (void)dealloc {
    NSLog(@"Homevc delloc");
}
@end
