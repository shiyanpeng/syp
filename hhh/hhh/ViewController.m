//
//  ViewController.m
//  hhh
//
//  Created by syp on 15/12/7.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *button2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(100, 100, 200, 30);
    self.button.backgroundColor = [UIColor blackColor];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"520  我爱你"];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 3)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(4, 3)];
    [self.button setAttributedTitle:string forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    
    {
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button2.frame = CGRectMake(100, 130, 200, 30);
    self.button2.backgroundColor = [UIColor blackColor];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"052  我爱你"];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor clearColor] range:NSMakeRange(1, 4)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(4, 3)];
    [self.button2 setAttributedTitle:string forState:UIControlStateNormal];
    [self.view addSubview:self.button2];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)click:(UITapGestureRecognizer *)gesture
{

}

@end
