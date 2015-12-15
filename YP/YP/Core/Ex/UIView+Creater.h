//
//  UIView+Creater.h
//  YP
//
//  Created by syp on 15/10/28.
//  Copyright © 2015年 syp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(Creater)

+ (instancetype)createInSuperView:(UIView *)superView properties:(NSDictionary *)properties;
+ (instancetype)createInSuperView:(UIView *)superView;

@end

@interface UILabel(Creater)

+ (instancetype)createInSuperView:(UIView *)superView
                             text:(NSString *)title
                         fontSize:(float)fontSize
                        textColor:(NSUInteger)textColor;

@end

@interface UITextField (Creater)

+ (instancetype)createInSuperView:(UIView *)superView
                         fontSize:(float)fontSize
                        textColor:(NSUInteger)textColor
                      placeHolder:(NSString *)placeHolder;

@end

@interface UIButton (Creater)

+ (instancetype)createInSuperView:(UIView *)superView
                      normalImage:(UIImage *)normalImage
                      normalTitle:(NSString *)normalTitle
                 normalTitleColor:(NSUInteger)normalTitleColor
            touchUpInsideSelector:(SEL)selector
                           target:(id)target;

@end