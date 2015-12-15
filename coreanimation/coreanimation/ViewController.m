//
//  ViewController.m
//  coreanimation
//
//  Created by syp on 15/10/20.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CALayer *layer1 = [[CALayer alloc] init];
    layer1.frame = CGRectMake(100, 100, 200, 200);
    layer1.cornerRadius = 20;
    layer1.masksToBounds = YES;
    [self.view.layer addSublayer:layer1];
    
    CALayer *layer2 = [[CALayer alloc] init];
    layer2.frame = CGRectMake(0, 0, 150, 150);
    layer2.backgroundColor = [UIColor redColor].CGColor;
    [layer1 addSublayer:layer2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
