//
//  YPAnimationDemoBaseViewController.h
//  YP
//
//  Created by syp on 15/12/15.
//  Copyright © 2015年 syp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YPAnimationDemoBaseViewController : UIViewController

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *endButton;

- (void)startAnimation;
- (void)endAnimation;

@end
