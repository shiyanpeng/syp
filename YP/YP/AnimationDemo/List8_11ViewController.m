//
//  List8_11ViewController.m
//  YP
//
//  Created by syp on 15/12/16.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "List8_11ViewController.h"
#import "UIView+YPFrameMaker.h"


@interface List8_11ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) CATransition *transition;

@end

@implementation List8_11ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _images = @[[UIImage imageNamed:@"启动页1"],
                [UIImage imageNamed:@"启动页2"],
                [UIImage imageNamed:@"启动页3"],
                [UIImage imageNamed:@"启动页4"]];
    
    _imageView = [UIImageView createInSuperView:self.contentView image:self.images[0]];
    
    _transition = [[CATransition alloc] init];
    self.transition.type = kCATransitionMoveIn;
    self.transition.duration = 2;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.imageView makeFrame:^(YPFrameMaker *make) {
        [make fillToSuperView];
    }];
}

- (void)startAnimation
{
    [self.imageView.layer addAnimation:self.transition forKey:@"ttttttttt"];
    NSUInteger index = [self.images indexOfObject:self.imageView.image] + 1;
    if (index >= self.images.count) {
        index = 0;
    }
    self.imageView.image = self.images[index];
}

- (void)endAnimation
{
}

@end
