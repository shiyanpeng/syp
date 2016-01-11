//
//  ViewController.m
//  AnimationDemo
//
//  Created by syp on 15/12/15.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "YPAnimationDemoListViewController.h"
#import "Listing8_8ViewController.h"
#import "List8_11ViewController.h"
#import "Listing10_6ViewController.h"
#import "YPFigure3_3ViewController.h"


@interface YPAnimationDemoListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *demos;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation YPAnimationDemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Animation Demos";
    
    _demos = @[@"Figure 3.3 The effect that changing the anchorPoint has on the frame",
               @"Listing 8.8 Rotating a Layer by Animating the transform Property",
               @"Listing 8.11 AnimatingaUIImageViewUsingCATransition",
               @"Listing 10.6 Implementing a Bouncing Ball Animation Using Keyframes"];
    
    _tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews
{
    self.tableView.frame = self.view.bounds;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.demos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = (NSString *)self.demos[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController = nil;
    NSString *demo = self.demos[indexPath.row];
    if ([demo hasPrefix:@"Figure 3.3"]) {
        viewController = [[YPFigure3_3ViewController alloc] init];
    }
    else if ([demo hasPrefix:@"Listing 8.8"]) {
        viewController = [[Listing8_8ViewController alloc] init];
    }
    else if ([demo hasPrefix:@"Listing 8.11"]) {
        viewController = [[List8_11ViewController alloc] init];
    }
    else if ([demo hasPrefix:@"Listing 10.6"]) {
        viewController = [[Listing10_6ViewController alloc] init];
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
