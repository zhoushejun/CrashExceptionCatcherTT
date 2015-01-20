//
//  ViewController.m
//  CrashExceptionCatcherTT
//
//  Created by zhoushejun on 15-1-20.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 30, 100, 44);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    btn.titleLabel.textColor = [UIColor orangeColor];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnPress:(id)sender{
    NSArray *array = [NSArray arrayWithObjects:@"0", nil];
    NSLog(@"%@", array[1]);
}

@end
