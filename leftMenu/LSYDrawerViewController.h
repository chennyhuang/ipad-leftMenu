//
//  LSYDrawerViewController.h
//  ReaderPlatformUniversal
//
//  Created by 刘思洋 on 15/4/28.
//  Copyright (c) 2015年 刘思洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ContentViewDragDirection) {
    ContentViewDragDirectionLeft      = 0,    // 向左滑
    ContentViewDragDirectionRight     = 1,
};

@interface LSYDrawerViewController : UIViewController

@property (assign, nonatomic) BOOL dragEnabled;
@property (nonatomic, assign) CGFloat contentWidth;

- (instancetype)initWithViewController:(UIViewController *)viewController contentWidth:(CGFloat)width;

- (void)show;
- (void)dismiss;

//拖拽结束的动画
- (void)contentViewDraggingEndWithDirection:(ContentViewDragDirection)direction;
//设置平移量
- (void)setContentViewTranslation:(CGFloat)translation;

@end

@interface UIViewController (LSYDrawerViewController)

@property (strong, nonatomic) LSYDrawerViewController *drawerViewController;

@end
