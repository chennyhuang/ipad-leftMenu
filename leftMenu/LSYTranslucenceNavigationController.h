//
//  LSYTranslucenceNavigationController.h
//  ReaderPlatformUniversal
//
//  Created by 刘思洋 on 15/6/25.
//  Copyright (c) 2015年 刘思洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSYTranslucenceNavigationController : UIViewController

@property (strong, nonatomic) NSMutableArray *viewControllers;

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController;

//退出整个导航控制器
- (void)controllerShouldDisappear;

- (void)pushViewController:(UIViewController *)viewController;
- (void)popViewController;

@end


@interface UIViewController (TranslucenceNavigation)

@property (strong, nonatomic) LSYTranslucenceNavigationController *translucenceNavigationController;

@end