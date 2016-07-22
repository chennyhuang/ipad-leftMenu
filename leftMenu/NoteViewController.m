//
//  NoteViewController.m
//  leftMenu
//
//  Created by 黄振宇 on 16/7/21.
//  Copyright © 2016年 YunMei. All rights reserved.
//

#import "NoteViewController.h"

@interface NoteViewController ()

@end

@implementation NoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSArray *array = @[@"0",@"1",@"2",@"3"];
    
    for (NSString *str in array) {
        NSLog(@"%@",str);
    }
    
//    NSLog(@"%@",array);
//    
//    NSLog(@"last %@",[array lastObject]);
//    NSLog(@"first %@",[array firstObject]);
    
}

@end
