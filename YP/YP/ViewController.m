//
//  ViewController.m
//  YP
//
//  Created by syp on 15/12/15.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "ViewController.h"
#import "YPCore.h"
#import "UIView+YPFrameMaker.h"


@interface ViewController ()

strongProperty UILabel *nameLabel;
strongProperty UITextField *nameTextField;
strongProperty UILabel *passwordLabel;
strongProperty UITextField *passwordTextField;
strongProperty UIButton *okButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    _nameLabel = [UILabel createInSuperView:self.view
                                       text:@"用户名："
                                   fontSize:15
                                  textColor:0x000000];
    _nameTextField = [UITextField createInSuperView:self.view
                                           fontSize:15
                                          textColor:0x000000
                                        placeHolder:@"请输入用户名"];
    _passwordLabel = [UILabel createInSuperView:self.view
                                           text:@"密   码："
                                       fontSize:15
                                      textColor:0x000000];
    _passwordTextField = [UITextField createInSuperView:self.view
                                               fontSize:15
                                              textColor:0x000000
                                            placeHolder:@"请输入密码"];
    _okButton = [UIButton createInSuperView:self.view normalImage:nil normalTitle:@"登录" normalTitleColor:0x000000 touchUpInsideSelector:nil target:nil];
    self.okButton.backgroundColor = [UIColor redColor];
}

- (void)viewDidLayoutSubviews
{
    [self.nameLabel makeFrame:^(YPFrameMaker *make) {
        make.left.equalToSuperviewLeft().offset(15);
        make.top.equalToSuperviewTop().offset(150);
        make.width.setValue(60);
        make.height.setValue(20);
    }];
    
    [self.nameTextField makeFrame:^(YPFrameMaker *make) {
        make.left.equalTo(self.nameLabel.right).offset(5);
        make.right.equalToSuperviewRight().offset(-15);
        make.top.equalTo(self.nameLabel.top);
        make.height.equalTo(self.nameLabel.height);
    }];
    
    [self.passwordLabel makeFrame:^(YPFrameMaker *make) {
        make.top.equalTo(self.nameLabel.bottom).offset(10);
        make.left.equalTo(self.nameLabel.left);
        make.width.equalTo(self.nameLabel.width);
        make.height.equalTo(self.nameLabel.height);
    }];
    
    [self.passwordTextField makeFrame:^(YPFrameMaker *make) {
        make.left.equalTo(self.nameTextField.left);
        make.width.equalTo(self.nameTextField.width);
        make.centerY.equalTo(self.passwordLabel.centerY);
        make.top.equalTo(self.nameTextField.bottom).offset(10);
    }];
    
    [self.okButton makeFrame:^(YPFrameMaker *make) {
        make.left.equalToSuperviewLeft().offset(15);
        make.right.equalToSuperviewRight().offset(-15);
        make.top.equalTo(self.passwordTextField.bottom).offset(30);
        make.height.setValue(40);
    }];
}

@end
