//
//  YPAnimationDemoBaseViewController.m
//  YP
//
//  Created by syp on 15/12/15.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "YPAnimationDemoBaseViewController.h"
#import "UIView+YPFrameMaker.h"


@interface YPAnimationDemoBaseViewController ()

@end

@implementation YPAnimationDemoBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _contentView = [UIView createInSuperView:self.view];
    
    _startButton = [UIButton createInSuperView:self.view
                                   normalImage:nil
                                   normalTitle:@"start"
                              normalTitleColor:0xffffff
                         touchUpInsideSelector:@selector(clickStartButton:)
                                        target:self];
}

- (void)viewDidLayoutSubviews
{
    [self.contentView makeFrame:^(YPFrameMaker *make) {
        make.left.equalToSuperviewLeft.offset(0);
        make.right.equalToSuperviewRight.offset(0);
        make.top.equalToSuperviewTop.offset(0);
        make.bottom.equalToSuperviewBottom.offset(-44);
    }];
    
    [self.startButton makeFrame:^(YPFrameMaker *make) {
        make.left.equalToSuperviewLeft.offset(0);
        
    }];
}

- (void)clickStartButton:(UIButton *)button
{
    [self startAnimation];
}

- (void)startAnimation
{
    
}

@end
