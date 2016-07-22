//
//  HexColor.h
//  leftMenu
//
//  Created by 黄振宇 on 16/7/21.
//  Copyright © 2016年 YunMei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HexColor : NSObject
+ (UIColor *)colorWithHex:(long)hexColor;

+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

+ (UIColor *)colorWithHexString: (NSString *) hexString;

//@"33,255,255"
+ (UIColor *)colorWithRgb:(NSString *)rgb;

//@"#ff0000,#ff3333"
+ (NSArray *)gradientColorWithHexString: (NSString *)hexString;

@end
