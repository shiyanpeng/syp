//
//  UIView+Creater.m
//  YP
//
//  Created by syp on 15/10/28.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "UIView+Creater.h"
#import "UIColor+Utility.h"


@implementation UIView(Creater)

+ (instancetype)createInSuperView:(UIView *)superView properties:(NSDictionary *)properties
{
    UIView *view = [[[self class] alloc] init];
    for (NSString *propertyName in properties.allKeys) {
        id propertyValue = [properties valueForKey:propertyName];
        [view setValue:propertyValue forKey: propertyName];//对属性赋值
    }
    [superView addSubview:view];
    return view;
}

+ (instancetype)createInSuperView:(UIView *)superView
{
    UIView *view = [[UIView alloc] init];
    [superView addSubview:view];
    return view;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    [super setValue:value forUndefinedKey:key];
    NSLog(@"- (void)setValue:(id)value forUndefinedKey:(NSString *)key------{key:%@,value:%@}", key, value);
}

@end


@implementation UILabel(Creater)

+ (instancetype)createInSuperView:(UIView *)superView text:(NSString *)text fontSize:(float)fontSize textColor:(NSUInteger)textColor
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = HEX_RGB(textColor);
    [superView addSubview:label];
    return label;
}

@end

@implementation UITextField(Creater)

+ (instancetype)createInSuperView:(UIView *)superView fontSize:(float)fontSize textColor:(NSUInteger)textColor placeHolder:(NSString *)placeHolder
{
    UITextField *textField = [[UITextField alloc] init];
    textField.font = [UIFont systemFontOfSize:fontSize];
    textField.textColor = HEX_RGB(textColor);
    textField.placeholder = placeHolder;
    [superView addSubview:textField];
    return textField;
}

@end

@implementation UIButton

+ (instancetype)createInSuperView:(UIView *)superView normalImage:(UIImage *)normalImage normalTitle:(NSString *)normalTitle normalTitleColor:(NSUInteger)normalTitleColor touchUpInsideSelector:(SEL)selector target:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setTitleColor:HEX_RGB(normalTitleColor) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    return button;
}

@end
