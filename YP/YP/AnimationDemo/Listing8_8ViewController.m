//
//  Listing8_8ViewController.m
//  AnimationDemo
//
//  Created by syp on 15/12/15.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "Listing8_8ViewController.h"

@interface Listing8_8ViewController ()

@property (nonatomic, strong) CALayer *animationLayer;
@property (nonatomic, strong) CABasicAnimation *animation;

@end

@implementation Listing8_8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentView.backgroundColor = [UIColor blackColor];
    
    _animationLayer = [[CALayer alloc] init];
    self.animationLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"玫瑰"].CGImage);
    [self.contentView.layer addSublayer:self.animationLayer];
    
    _animation = [[CABasicAnimation alloc] init];
    self.animation.duration = 5;
    self.animation.fromValue = 0;
//    self.animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI * 2, 0, 0, 1)];
//    self.animation.keyPath = @"transform";
    self.animation.keyPath = @"transform.rotation";
    self.animation.toValue = @(M_PI * 2);
//    self.animation.speed = 2;
    self.animation.beginTime = 0.2;
    self.animation.repeatCount = HUGE_VAL;
    self.animation.fillMode = kCAFillModeBoth;
}

- (void)startAnimation
{
    [self.animationLayer addAnimation:self.animation forKey:@"animation"];
}


-(void)endAnimation
{
    self.animationLayer.speed = 0;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.animationLayer.frame = CGRectMake((self.contentView.bounds.size.width - 100) / 2, (self.contentView.bounds.size.height - 100) / 2, 100, 100);
    
    
}

@end
