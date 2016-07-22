//
//  UserCenterTableViewCell.h
//  ReaderPlatformUniversal
//
//  Created by 刘思洋 on 15/7/27.
//  Copyright (c) 2015年 刘思洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserCenterTableViewCell : UITableViewCell

@property (strong, nonatomic) NSString *imageName;

@property (strong, nonatomic) IBOutlet UIImageView *imageV;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;


@end
