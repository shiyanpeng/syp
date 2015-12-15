//
//  UIView+YPFrameBuilder.h
//  DemoApp
//
//  Created by syp on 15/10/6.
//  Copyright (c) 2015年 Citrix Systems, Inc. All rights reserved.
//

#import "YPFrameBuilder.h"

typedef void(^buildFrameBlock)(YPFrameBuilder *builder);

@interface UIView (YPFrameBuilder)

- (void)buildFrame:(buildFrameBlock)buildFrameBlock;

//+ (void)alignViewsVertically:(NSArray *)views spacingWithBlock:(CGFloat (^)(NSUInteger index))spacingBlock;
//+ (void)alignViewsVertically:(NSArray *)views spacingWithBlock:(CGFloat (^)(NSUInteger index))spacingBlock sizingWithBlock:(CGSize (^)(int index))sizingBlock;
//+ (void)alignViewsHorizontally:(NSArray *)views spacingWithBlock:(CGFloat (^)(NSUInteger index))spacingBlock;
//+ (void)alignViewsHorizontally:(NSArray *)views spacingWithBlock:(CGFloat (^)(NSUInteger index))spacingBlock sizingWithBlock:(CGSize (^)(int index))sizingBlock;

@end
