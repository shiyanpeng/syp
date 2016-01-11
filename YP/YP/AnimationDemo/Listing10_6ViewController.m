//
//  Listing10_6ViewController.m
//  YP
//
//  Created by syp on 15/12/18.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "Listing10_6ViewController.h"
#import "UIView+YPFrameMaker.h"



@interface Listing10_6ViewController ()

@property (nonatomic, strong) UIImageView *ballImageView;

@end

@implementation Listing10_6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentView.backgroundColor = [UIColor blackColor];
    
    _ballImageView = [[UIImageView alloc] init];
    self.ballImageView.image = [UIImage imageNamed:@"真心话红点"];
    [self.contentView addSubview:self.ballImageView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.ballImageView makeFrame:^(YPFrameMaker *make) {
        make.centerX.equalToSuperviewCenterX.offset(0);
        make.centerY.setValue(32);
        make.width.setValue(50);
        make.height.setValue(50);
    }];
}

#define NSValueWithY(y) [NSValue valueWithCGPoint:CGPointMake(self.ballImageView.center.x, y)]
- (void)startAnimation
{
    CAKeyframeAnimation *animation = [[CAKeyframeAnimation alloc] init];
    animation.keyPath = @"position";
    animation.duration = 1;
    animation.values = @[NSValueWithY(32),
                         NSValueWithY(268),
                         NSValueWithY(140),
                         NSValueWithY(268),
                         NSValueWithY(220),
                         NSValueWithY(268),
                         NSValueWithY(250),
                         NSValueWithY(268)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    animation.keyTimes = @[@0.0,
                           @0.3,
                           @0.5,
                           @0.7,
                           @0.8,
                           @0.9,
                           @0.95,
                           @1.0];
    
    self.ballImageView.layer.position = CGPointMake(self.ballImageView.center.x, 268);
    [self.ballImageView.layer addAnimation:animation forKey:@"animation"];
}

@end
