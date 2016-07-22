//
//  NavigationBarViewController.h
//  ReaderPlatformUniversal
//
//  Created by 刘思洋 on 14/12/17.
//  Copyright (c) 2014年 刘思洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationBarViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *leftView;
@property (strong, nonatomic) IBOutlet UIView *rightView;
@property (strong, nonatomic) IBOutlet UIView *separaterLine;


@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UIButton *searchButton;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIView *titleView;



@end
