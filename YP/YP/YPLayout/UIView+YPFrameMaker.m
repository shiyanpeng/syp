//
//  UIView+YPFrameMaker.m
//  YP
//
//  Created by syp on 15/10/30.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "UIView+YPFrameMaker.h"
#import "YPViewAttribute.h"


@implementation UIView(YPFrameMaker)

- (void)makeFrame:(void(^)(YPFrameMaker *make))block
{
    YPFrameMaker *make = [[YPFrameMaker alloc] initWithTargetView:self];
    block(make);
    [make applyToView];
}

#pragma mark -

#define UIView_YPLayoutAttribute_Property(propertyName, attribute)                              \
- (YPViewAttribute *)propertyName                                                               \
{                                                                                               \
    return [[YPViewAttribute alloc] initWithView:self layoutAttribute:attribute];               \
}                                                                                               \

UIView_YPLayoutAttribute_Property(left, YPLayoutAttributeLeft)
UIView_YPLayoutAttribute_Property(right, YPLayoutAttributeRight)
UIView_YPLayoutAttribute_Property(top, YPLayoutAttributeTop)
UIView_YPLayoutAttribute_Property(bottom, YPLayoutAttributeBottom)
UIView_YPLayoutAttribute_Property(width, YPLayoutAttributeWidth)
UIView_YPLayoutAttribute_Property(height, YPLayoutAttributeHeight)
UIView_YPLayoutAttribute_Property(centerX, YPLayoutAttributeCenterX)
UIView_YPLayoutAttribute_Property(centerY, YPLayoutAttributeCenterY)

@end
