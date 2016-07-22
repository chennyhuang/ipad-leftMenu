//
//  RegisterNextViewController.m
//  leftMenu
//
//  Created by 黄振宇 on 16/7/22.
//  Copyright © 2016年 YunMei. All rights reserved.
//

#import "RegisterNextViewController.h"
#import "LSYTranslucenceNavigationController.h"

@interface RegisterNextViewController ()

@end

@implementation RegisterNextViewController

- (IBAction)back:(id)sender {
    [self.translucenceNavigationController popViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"next viewWillAppear");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"next viewWillDisappear");
}

- (void)dealloc{
    NSLog(@"next delloc");
}
@end
