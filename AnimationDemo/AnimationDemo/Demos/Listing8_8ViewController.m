//
//  Listing8_8ViewController.m
//  AnimationDemo
//
//  Created by syp on 15/12/15.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "Listing8_8ViewController.h"

@interface Listing8_8ViewController ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) CALayer *animationLayer;

@end

@implementation Listing8_8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _contentView = [[UIView alloc] init];
    [self.view addSubview:self.contentView];
    
    _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.startButton setTitle:@"start" forState:UIControlStateNormal];
    [self.startButton addTarget:self action:@selector(clickStartButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startButton];
    
}

- (void)viewDidLayoutSubviews
{
    CGRect frame = self.view.bounds;
    frame.size.height -= 44;
    self.contentView.frame = frame;
}

- (void)clickStartButton:(UIButton *)button
{
    
}

@end
