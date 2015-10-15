//
//  YPFrameBuilder.h
//  DemoApp
//
//  Created by syp on 15/10/6.
//  Copyright (c) 2015年 Citrix Systems, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YPFrameBuilder : NSObject

@property (nonatomic, assign, readonly) CGRect frame;

- (instancetype)initWithFrame:(CGRect)frame;

// Move
- (YPFrameBuilder *)moveToX:(CGFloat)x;
- (YPFrameBuilder *)moveToY:(CGFloat)y;
- (YPFrameBuilder *)moveToOrigin:(CGPoint)origin;
- (YPFrameBuilder *)moveToOriginWithX:(CGFloat)x y:(CGFloat)y;
- (YPFrameBuilder *)moveToView:(UIView *)view;

- (YPFrameBuilder *)moveWithOffsetX:(CGFloat)offsetX;
- (YPFrameBuilder *)moveWithOffsetY:(CGFloat)offsetY;
- (YPFrameBuilder *)moveWithOffsetX:(CGFloat)offsetX offsetY:(CGFloat)offsetY;

// Resize
- (YPFrameBuilder *)setWidth:(CGFloat)width;
- (YPFrameBuilder *)setHeight:(CGFloat)height;
- (YPFrameBuilder *)setSize:(CGSize)size;
- (YPFrameBuilder *)setFrame:(CGRect)frame;
- (YPFrameBuilder *)setSizeWithWidth:(CGFloat)width height:(CGFloat)height;
- (YPFrameBuilder *)setWidthEqualToView:(UIView *)view;
- (YPFrameBuilder *)setHeightEqualToView:(UIView *)view;
- (YPFrameBuilder *)setSizeEqualToView:(UIView *)view;
- (YPFrameBuilder *)setFrameEqualToView:(UIView *)view;

//Alignment
- (YPFrameBuilder *)alignToCenterInSuperview:(UIView *)superview;
- (YPFrameBuilder *)alignToCenterHorizontallyInSuperview:(UIView *)superview;
- (YPFrameBuilder *)alignToCenterVerticallyInSuperview:(UIView *)superview;

- (YPFrameBuilder *)alignToTopInSuperview:(UIView *)superview;
- (YPFrameBuilder *)alignToBottomInSuperview:(UIView *)superview;
- (YPFrameBuilder *)alignToLeftInSuperview:(UIView *)superview;
- (YPFrameBuilder *)alignRightInSuperview:(UIView *)superview;
- (YPFrameBuilder *)fillInSuperview:(UIView *)superview;

- (YPFrameBuilder *)alignToTopInSuperview:(UIView *)superview offset:(CGFloat)offset;
- (YPFrameBuilder *)alignToBottomInSuperview:(UIView *)superview offset:(CGFloat)offset;
- (YPFrameBuilder *)alignToLeftInSuperview:(UIView *)superview offset:(CGFloat)offset;
- (YPFrameBuilder *)alignToRightInSuperview:(UIView *)superview offset:(CGFloat)offset;
- (YPFrameBuilder *)fillInSuperview:(UIView *)superview insets:(UIEdgeInsets)insets;

- (YPFrameBuilder *)alignToTopOfView:(UIView *)view;
- (YPFrameBuilder *)alignToBottomOfView:(UIView *)view;
- (YPFrameBuilder *)alignToLeftOfView:(UIView *)view;
- (YPFrameBuilder *)alignToRightOfView:(UIView *)view;

- (YPFrameBuilder *)alignToTopOfView:(UIView *)view offset:(CGFloat)offset;
- (YPFrameBuilder *)alignToBottomOfView:(UIView *)view offset:(CGFloat)offset;
- (YPFrameBuilder *)alignToLeftOfView:(UIView *)view offset:(CGFloat)offset;
- (YPFrameBuilder *)alignToRightOfView:(UIView *)view offset:(CGFloat)offset;

@end
