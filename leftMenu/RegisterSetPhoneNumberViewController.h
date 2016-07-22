//
//  RegisterSetPhoneNumberViewController.h
//  ReaderPlatformUniversal
//
//  Created by 刘思洋 on 15/6/25.
//  Copyright (c) 2015年 刘思洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RegisterType) {
    RegisterTypeRegister           = 0,    // 注册
    RegisterTypeResetPassword      = 1,    // 找回密码
};

@interface RegisterSetPhoneNumberViewController : UIViewController

@property (assign, nonatomic) RegisterType viewType;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UIButton *licenceBtn;

@end
