//
//  YPViewAttribute.h
//  YP
//
//  Created by syp on 15/10/30.
//  Copyright © 2015年 syp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YPCore.h"

typedef NS_ENUM(NSInteger, YPLayoutAttribute) {
    YPLayoutAttributeNotAnAttribute = 0,
    YPLayoutAttributeLeft = 1,
    YPLayoutAttributeRight = YPLayoutAttributeLeft<<1,
    YPLayoutAttributeWidth = YPLayoutAttributeLeft<<2,
    YPLayoutAttributeCenterX = YPLayoutAttributeLeft<<3,
    
    YPLayoutAttributeTop = -YPLayoutAttributeLeft,
    YPLayoutAttributeBottom = -YPLayoutAttributeRight,
    YPLayoutAttributeHeight = -YPLayoutAttributeWidth,
    YPLayoutAttributeCenterY = -YPLayoutAttributeCenterX,
};


@interface YPViewAttribute : NSObject

readonlyProperty UIView *view;
readonlyProperty YPLayoutAttribute layoutAttribute;
readonlyProperty BOOL isSuperview;

- (id)initWithView:(UIView *)view layoutAttribute:(YPLayoutAttribute)layoutAttribute;
- (id)initWithView:(UIView *)view layoutAttribute:(YPLayoutAttribute)layoutAttribute isSuperview:(BOOL)isSuperview;

//- (BOOL)isSizeAttribute;

@end
