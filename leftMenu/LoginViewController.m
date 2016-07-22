//
//  LoginViewController.m
//  ReaderPlatformUniversal
//
//  Created by 刘思洋 on 15/6/25.
//  Copyright (c) 2015年 刘思洋. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterSetPhoneNumberViewController.h"
#import "LSYTranslucenceNavigationController.h"
#import "NavigationBarViewController.h"
#import "HexColor.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    IBOutlet UIButton *_loginButton;
}

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //添加leftView
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _userNameTextField.frame.size.height , _userNameTextField.frame.size.height)];
    UIImageView *leftImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_userName"]];
    leftImage.frame = CGRectMake(0, 0, 35, 35);
    leftImage.center = CGPointMake(leftView.bounds.size.width / 2, leftView.bounds.size.height / 2);
    [leftView addSubview:leftImage];
    leftImage.contentMode = UIViewContentModeScaleAspectFit;
    
    _userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    _userNameTextField.leftView = leftView;
    _userNameTextField.layer.borderColor = [HexColor colorWithHexString:@"dedede"].CGColor;
    _userNameTextField.layer.borderWidth = 1.0;
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _passwordTextField.frame.size.height, _passwordTextField.frame.size.height)];
    leftImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_password"]];
    leftImage.frame = CGRectMake(0, 0, 35, 35);
    leftImage.center = CGPointMake(rightView.bounds.size.width / 2, rightView.bounds.size.height / 2);
    [rightView addSubview:leftImage];
    leftImage.contentMode = UIViewContentModeScaleAspectFit;
    
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    _passwordTextField.leftView = rightView;
    _passwordTextField.layer.borderColor = [HexColor colorWithHexString:@"dedede"].CGColor;
    _passwordTextField.layer.borderWidth = 1.0;
}

#pragma mark - action method

- (IBAction)loginButtonClicked:(id)sender {
}

//跳转到注册页面
- (IBAction)jumpToRegisterView:(id)sender {
    
    RegisterSetPhoneNumberViewController *registerVC = [[RegisterSetPhoneNumberViewController alloc] init];
    registerVC.viewType = RegisterTypeRegister;
    [self.translucenceNavigationController pushViewController:registerVC];

}

//跳转到重置密码页面
- (IBAction)jumpToFindPasswordView:(UIButton *)sender {
    
    RegisterSetPhoneNumberViewController *registerVC = [[RegisterSetPhoneNumberViewController alloc] init];
    registerVC.viewType = RegisterTypeResetPassword;
 
    [self.translucenceNavigationController pushViewController:registerVC];
   
}

//关闭登陆界面
- (IBAction)returnButtonClicked:(UIButton *)sender {
    
    [self.translucenceNavigationController controllerShouldDisappear];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"login viewWillAppear");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"login viewWillDisappear");
}

-(void)dealloc
{
    NSLog(@"loginView dealloc");
}

@end
