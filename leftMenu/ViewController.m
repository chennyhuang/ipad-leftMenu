//
//  ViewController.m
//  leftMenu
//
//  Created by 黄振宇 on 16/7/20.
//  Copyright © 2016年 YunMei. All rights reserved.
//

#import "ViewController.h"
#import "UserCenterTableViewCell.h"
#import "HomePageViewController.h"
#import "NoteViewController.h"
#import "ExperienceViewController.h"
#import "FavoriteViewController.h"
#import "SettingViewController.h"
#import "UserCenterHeaderCell.h"
#import "LoginViewController.h"
#import "LSYTranslucenceNavigationController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    //当前展示的控制器
    UIViewController *_currentVC;
    LSYTranslucenceNavigationController *_tNav;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.leftMenuTableView registerNib:[UINib nibWithNibName:@"UserCenterTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    
    self.leftMenuTableView.backgroundColor = [UIColor clearColor];
    self.leftMenuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.leftMenuTableView.rowHeight = 60;
    UserCenterHeaderCell *headerView = [[NSBundle mainBundle] loadNibNamed:@"UserCenterHeaderCell" owner:self options:nil][0];
    headerView.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedUserHeaderImage:)];
    [headerView addGestureRecognizer:tap];
    self.leftMenuTableView.tableHeaderView = headerView;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
    //默认选中VC1
    [self.leftMenuTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[HomePageViewController alloc] init]];
    nav.navigationBar.hidden = YES;
    [self setViewControllerToContentView:nav];
}


- (void)tappedUserHeaderImage:(UITapGestureRecognizer *)tap{
    //使用自定义导航控制器 弹出pop框
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    LSYTranslucenceNavigationController *tNav = [[LSYTranslucenceNavigationController alloc] initWithRootViewController:loginVC];
    _tNav = tNav;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window.rootViewController addChildViewController:tNav];
    [window.rootViewController.view addSubview:tNav.view];

}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _tNav.view.frame = self.view.bounds;//支持横竖屏
}

- (void)setViewControllerToContentView:(UIViewController *)vc{
    if (_currentVC != vc) {
        //移除当前控制器
        [_currentVC removeFromParentViewController];
        [_currentVC.view removeFromSuperview];
        vc.view.frame = _rightContentView.bounds;
        [self addChildViewController:vc];
        [_rightContentView addSubview:vc.view];
        
        _currentVC = vc;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"首页";
        cell.imageName = @"userCenter_homePage_icon";
    } else if (indexPath.row == 1){
        cell.titleLabel.text = @"笔记";
        cell.imageName = @"userCenter_note_icon";
    } else if (indexPath.row == 2){
        cell.titleLabel.text = @"阅历";
        cell.imageName = @"userCenter_experience_icon";
    } else if (indexPath.row == 3) {
        cell.titleLabel.text = @"收藏";
        cell.imageName = @"userCenter_favorite_icon";
    } else {
        cell.titleLabel.text = @"设置";
        cell.imageName = @"userCenter_setting_icon";
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = nil;
    if (indexPath.row == 0) {
        vc = [[HomePageViewController alloc] init];
    } else if (indexPath.row == 1) {
        vc = [[NoteViewController alloc] init];
    } else if (indexPath.row == 2) {
        vc = [[ExperienceViewController alloc] init];
    } else if (indexPath.row == 3) {
        vc = [[FavoriteViewController alloc] init];
    } else if (indexPath.row == 4) {
        vc = [[SettingViewController alloc] init];
    }
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.hidden = YES;
    [self setViewControllerToContentView:nav];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return (UIInterfaceOrientationMaskPortrait);
}
@end
