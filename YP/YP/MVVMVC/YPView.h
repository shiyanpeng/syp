//
//  YPView.h
//  YP
//
//  Created by syp on 15/10/11.
//  Copyright (c) 2015年 syp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YPViewController.h"


@protocol YPViewProtocol <NSObject>

- (void)didInit;
- (void)didLoad;
- (void)didReceiveMemoryWarning;
- (void)willAppear:(BOOL)animated;
- (void)didAppear:(BOOL)animated;
- (void)willDisappear:(BOOL)animated;
- (void)didDisappear:(BOOL)animated;

- (void)setController:(YPViewController *)controller;

@end

@interface YPView : UIView <YPViewProtocol>

@property (nonatomic, weak) YPViewController *controller;

@end
