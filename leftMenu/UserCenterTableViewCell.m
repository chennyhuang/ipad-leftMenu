//
//  UserCenterTableViewCell.m
//  ReaderPlatformUniversal
//
//  Created by 刘思洋 on 15/7/27.
//  Copyright (c) 2015年 刘思洋. All rights reserved.
//

#import "UserCenterTableViewCell.h"
#import "HexColor.h"

@implementation UserCenterTableViewCell

- (void)awakeFromNib {
    
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    if (selected) {
//        _titleLabel.textColor = [HexColor colorWithHexString:@"03ed94"];
//        _imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_highLight",_imageName]];
//    }else{
//        _titleLabel.textColor = [UIColor whiteColor];
//        _imageV.image = [UIImage imageNamed:_imageName];
//    }
//}

#pragma mark - setter & getter 

-(void)setImageName:(NSString *)imageName
{
    if (_imageName != imageName) {
        _imageName = imageName;
        
        self.imageV.image = [UIImage imageNamed:imageName];
    }
}

@end
