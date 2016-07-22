//
//  RegisterSetPhoneNumberViewController.m
//  ReaderPlatformUniversal
//
//  Created by 刘思洋 on 15/6/25.
//  Copyright (c) 2015年 刘思洋. All rights reserved.
//

#import "RegisterSetPhoneNumberViewController.h"
#import "LSYTranslucenceNavigationController.h"
#import "NavigationBarViewController.h"
#import "HexColor.h"
#import "RegisterNextViewController.h"

@interface RegisterSetPhoneNumberViewController ()<UITextFieldDelegate>{
    
    IBOutlet UIButton *_nextStepButton;
    IBOutlet UIView *_coverView;
    IBOutlet NSLayoutConstraint *_nextButtonTopLayout;
    IBOutlet UIActivityIndicatorView *_activityView;
    
}

@end

@implementation RegisterSetPhoneNumberViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"register viewWillAppear");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"register viewwillDisapper");
}

- (void)dealloc
{
    NSLog(@"register dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *licenceStr = @"《华图网络服务使用协议》";
    
    [_licenceBtn setTitle:licenceStr forState:UIControlStateNormal];
    _phoneNumberTextField.layer.borderColor = [HexColor colorWithHexString:@"dedede"].CGColor;
    _phoneNumberTextField.layer.borderWidth = 1.0;
    //添加leftView
    UIView *leftV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _phoneNumberTextField.frame.size.height / 2, _phoneNumberTextField.frame.size.height)];
    _phoneNumberTextField.leftViewMode = UITextFieldViewModeAlways;
    _phoneNumberTextField.leftView = leftV;

    if (_viewType == RegisterTypeResetPassword) {
        _coverView.hidden = NO;
        self.titleLabel.text = @"找回密码";
        _nextButtonTopLayout.constant = 30;
    } else {
        self.titleLabel.text = @"注册";
    }

}

- (IBAction)nextButtonClick:(id)sender {
    RegisterNextViewController *registerNextVC = [[RegisterNextViewController alloc] init];
    [self.translucenceNavigationController pushViewController:registerNextVC];
}

#pragma mark - action method

- (IBAction)back:(UIButton *)sender {

    [self.translucenceNavigationController popViewController];
    
}


@end
