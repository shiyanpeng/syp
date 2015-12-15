//
//  UIView+YPFrameBuilder.m
//  DemoApp
//
//  Created by syp on 15/10/6.
//  Copyright (c) 2015年 Citrix Systems, Inc. All rights reserved.
//

#import "UIView+YPFrameBuilder.h"

@implementation UIView (YPFrameBuilder)

- (void)buildFrame:(buildFrameBlock)buildFrameBlock
{
    YPFrameBuilder *builder = [[YPFrameBuilder alloc] initWithView:self];
    buildFrameBlock(builder);
    [builder apply];
}

@end
