//
//  TestViewController.m
//  leftMenu
//
//  Created by 黄振宇 on 16/7/21.
//  Copyright © 2016年 YunMei. All rights reserved.
//

#import "TestViewController.h"
#import "NavigationBarViewController.h"
#import "LSYDrawerViewController.h"

@interface TestViewController ()
@property (strong, nonatomic) NavigationBarViewController *navBar;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.titleLabel.text = @"test";
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //这边必须设置frame，否则界面显示有问题
    _navBar.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    NSLog(@"test view will appear");
//}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    NSLog(@"test view will disappear");
//}

- (void)dealloc {
    NSLog(@"test delloc");
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
                [_navBar.backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
                [_navBar.backButton setImage:[UIImage imageNamed:@"tb_fh"] forState:UIControlStateNormal];
        [self addChildViewController:_navBar];
        [self.view addSubview:_navBar.view];
    }
    return _navBar;
}

#pragma mark - action method

- (void)backButtonClicked:(UIBarButtonItem *)sender
{
    if (self.drawerViewController) {
        [self.drawerViewController dismiss];
    }
//    [self.navigationController popViewControllerAnimated:YES];
}


@end
