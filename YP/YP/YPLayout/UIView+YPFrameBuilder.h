//
//  UIView+YPFrameBuilder.h
//  DemoApp
//
//  Created by syp on 15/10/6.
//  Copyright (c) 2015年 Citrix Systems, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YPFrameBuilder.h"

typedef CGRect(^buildFrameBlock)(YPFrameBuilder *builder);

@interface UIView (YPFrameBuilder)

@property (nonatomic, assign, readonly) CGFloat left;
@property (nonatomic, assign, readonly) CGFloat top;
@property (nonatomic, assign, readonly) CGFloat right;
@property (nonatomic, assign, readonly) CGFloat bottom;
@property (nonatomic, assign, readonly) CGFloat width;
@property (nonatomic, assign, readonly) CGFloat height;
@property (nonatomic, assign, readonly) CGPoint origin;
@property (nonatomic, assign, readonly) CGSize  size;
@property (nonatomic, assign, readonly) CGFloat centerX;
@property (nonatomic, assign, readonly) CGFloat centerY;

- (void)buildFrame:(buildFrameBlock)buildFrameBlock;

+ (void)alignViewsVertically:(NSArray *)views spacingWithBlock:(CGFloat (^)(NSUInteger index))spacingBlock;
+ (void)alignViewsVertically:(NSArray *)views spacingWithBlock:(CGFloat (^)(NSUInteger index))spacingBlock sizingWithBlock:(CGSize (^)(int index))sizingBlock;
+ (void)alignViewsHorizontally:(NSArray *)views spacingWithBlock:(CGFloat (^)(NSUInteger index))spacingBlock;
+ (void)alignViewsHorizontally:(NSArray *)views spacingWithBlock:(CGFloat (^)(NSUInteger index))spacingBlock sizingWithBlock:(CGSize (^)(int index))sizingBlock;

+ (UILabel *)createLabelWith:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment superView:(UIView *)superView frame:(buildFrameBlock)block;
+ (UILabel *)createMutiLinesLabelWith:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment superView:(UIView *)superView frame:(buildFrameBlock)block;
+ (UILabel *)createSizeToFitLabelWith:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment superView:(UIView *)superView frame:(buildFrameBlock)block;
@end
