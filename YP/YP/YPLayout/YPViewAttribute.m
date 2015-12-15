//
//  YPViewAttribute.m
//  YP
//
//  Created by syp on 15/10/30.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "YPViewAttribute.h"

@interface YPViewAttribute () {
    __weak UIView *_view;
    YPLayoutAttribute _layoutAttribute;
}

@end

@implementation YPViewAttribute

- (id)initWithView:(UIView *)view layoutAttribute:(YPLayoutAttribute)layoutAttribute
{
    return [self initWithView:view layoutAttribute:layoutAttribute isSuperview:NO];
}

- (id)initWithView:(UIView *)view layoutAttribute:(YPLayoutAttribute)layoutAttribute isSuperview:(BOOL)isSuperview
{
    self = [super init];
    if (self) {
        _view = view;
        _layoutAttribute = layoutAttribute;
        _isSuperview = isSuperview;
    }
    return self;
}

- (UIView *)view
{
    return _view;
}

- (YPLayoutAttribute)layoutAttribute
{
    return _layoutAttribute;
}

@end
