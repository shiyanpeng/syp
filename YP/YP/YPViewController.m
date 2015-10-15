//
//  YPViewController.m
//  YP
//
//  Created by syp on 15/10/11.
//  Copyright (c) 2015年 syp. All rights reserved.
//

#import "YPViewController.h"
#import "YPView.h"
#import "YPViewModel.h"

@interface YPViewController ()

@property (nonatomic, strong) YPView *page;
@property (nonatomic, strong) YPViewModel *viewModel;

@end

@implementation YPViewController

- (id)initWithView:(YPView *)view
{
    self = [super init];
    if (self) {
        [self setView:view];
    }
    return self;
}

- (void)setView:(YPView *)view
{
    [super setView:view];
    if ([view isKindOfClass:[YPView class]]) {
        self.page = view;
        [self.page setController:self];
    }
    else {
        self.page = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.page didLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self.page didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.page didAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.page didDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.page willAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.page willDisappear:animated];
}

@end
