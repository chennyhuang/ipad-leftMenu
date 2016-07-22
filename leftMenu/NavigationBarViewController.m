//
//  NavigationBarViewController.m
//  ReaderPlatformUniversal
//
//  Created by 刘思洋 on 14/12/17.
//  Copyright (c) 2014年 刘思洋. All rights reserved.
//

#import "NavigationBarViewController.h"

@interface NavigationBarViewController ()

@end

@implementation NavigationBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    _titleLabel.frame = CGRectMake(0, 0, self.view.frame.size.width - 100, 44);
    _titleLabel.center = CGPointMake(self.view.frame.size.width / 2, 42);
    
    _titleView.center = CGPointMake(self.view.frame.size.width / 2, 42);
}

#pragma mark - setter & getter

-(UIButton *)backButton
{
    if (_backButton == nil) {
        self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(0, 0, 44, 44);
//        [_backButton setImage:[UIImage imageNamed:@"tb_fh"] forState:UIControlStateNormal];
        [self.leftView addSubview:_backButton];
    }
    
    return _backButton;
}

-(UIButton *)searchButton
{
    if (_searchButton == nil) {
        self.searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchButton.frame = CGRectMake(0, 0, 44, 44);
//        [_searchButton setImage:[UIImage imageNamed:@"tb_ss_dj"] forState:UIControlStateNormal];
        [self.rightView addSubview:_searchButton];
    }
    
    return _searchButton;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 100, 44)];
        _titleLabel.center = CGPointMake(self.view.frame.size.width / 2, 42);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

-(void)setTitleView:(UIView *)titleView
{
    if (_titleView != titleView) {
        _titleView = titleView;
        [self.view addSubview:titleView];
        titleView.center = CGPointMake(self.view.frame.size.width / 2, 42);
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
