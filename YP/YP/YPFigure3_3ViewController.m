//
//  YPFigure3_3ViewController.m
//  YP
//
//  Created by syp on 15/12/22.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "YPFigure3_3ViewController.h"
#import "UIView+YPFrameMaker.h"


@interface YPFigure3_3ViewController ()

@property (nonatomic, strong) UIView *demoView;

@end

@implementation YPFigure3_3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _demoView = [UIView createInSuperView:self.contentView];
    self.demoView.backgroundColor = [UIColor redColor];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.demoView makeFrame:^(YPFrameMaker *make) {
        make.width.setValue(40);
        make.height.setValue(50);
        make.left.setValue(10);
        make.top.setValue(10);
    }];
}

- (void)startAnimation
{
    self.demoView.layer.anchorPoint = CGPointMake(0.9, 0.9);
    [self printPoint:self.demoView.layer.position];
    [self printPoint:self.demoView.center];
    
//    self.demoView.layer.anchorPoint = CGPointMake(0.5, 0.5);
//    [self printPoint:self.demoView.layer.position];
}

- (void)printPoint:(CGPoint)point
{
    NSLog(@"{x:%f;y:%f}", point.x, point.y);
}

@end
