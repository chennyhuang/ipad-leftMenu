//
//  UserCenterHeaderCell.m
//  K12Reader
//
//  Created by 刘思洋 on 14/11/25.
//  Copyright (c) 2014年 刘思洋. All rights reserved.
//

#import "UserCenterHeaderCell.h"
#import "HexColor.h"

@implementation UserCenterHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _userNameLabel.text = @"点击头像登陆";
    _imageV.layer.cornerRadius = _imageV.frame.size.width/2;
    _imageV.layer.borderColor = [HexColor colorWithHexString:@"#dcdcdc"].CGColor;
    _imageV.layer.borderWidth = 1;
    _imageV.clipsToBounds = YES;
    _imageV.image = [UIImage imageNamed:@"userCenter_headerImage"];
}

@end
