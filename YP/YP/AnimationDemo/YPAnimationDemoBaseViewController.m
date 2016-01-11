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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    _contentView = [UIView createInSuperView:self.view];
    
    _startButton = [UIButton createInSuperView:self.view
                                   normalImage:nil
                                   normalTitle:@"start"
                              normalTitleColor:0x000000
                         touchUpInsideSelector:@selector(clickButton:)
                                        target:self];
    
    _endButton = [UIButton createInSuperView:self.view
                                 normalImage:nil
                                 normalTitle:@"end"
                            normalTitleColor:0x000000
                       touchUpInsideSelector:@selector(clickButton:)
                                      target:self];
}

- (void)viewDidLayoutSubviews
{
    [self.contentView makeFrame:^(YPFrameMaker *make) {
        [make fillToSuperViewWithEdgeInsets:UIEdgeInsetsMake(66, 0, 44, 0)];
    }];
    
    [self.startButton makeFrame:^(YPFrameMaker *make) {
        make.left.equalToSuperviewLeft.offset(0);
        make.right.equalToSuperviewCenterX.offset(0);
        make.top.equalTo(self.contentView.bottom);
        make.bottom.equalToSuperviewBottom.offset(0);
    }];
    
    [self.endButton makeFrame:^(YPFrameMaker *make) {
        make.left.equalTo(self.startButton.right);
        make.width.equalTo(self.startButton.width);
        make.top.equalTo(self.startButton.top);
        make.height.equalTo(self.startButton.height);
    }];
}

- (void)clickButton:(UIButton *)button
{
    if (button == self.startButton) {
       [self startAnimation];
    }
    else {
        [self endAnimation];
    }
}

- (void)startAnimation
{
    
}

- (void)endAnimation
{
    
}

@end
