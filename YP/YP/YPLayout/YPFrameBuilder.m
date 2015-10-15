//
//  YPFrameBuilder.m
//  DemoApp
//
//  Created by syp on 15/10/6.
//  Copyright (c) 2015年 Citrix Systems, Inc. All rights reserved.
//

#import "YPFrameBuilder.h"

@interface YPFrameBuilder ()

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;

@end

@implementation YPFrameBuilder

#pragma mark - init
- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        [self resetFrame:frame];
    }
    return self;
}

- (void)resetFrame:(CGRect)frame
{
    _x = frame.origin.x;
    _y = frame.origin.y;
    _w = frame.size.width;
    _h = frame.size.height;
}

#pragma mark - Move
- (YPFrameBuilder *)moveToX:(CGFloat)x
{
    self.x = x;
    return self;
}

- (YPFrameBuilder *)moveToY:(CGFloat)y
{
    self.y = y;
    return self;
}

- (YPFrameBuilder *)moveToOrigin:(CGPoint)origin;
{
    [self moveToOriginWithX:origin.x y:origin.y];
    return self;
}

- (YPFrameBuilder *)moveToOriginWithX:(CGFloat)x y:(CGFloat)y
{
    [[self moveToX:x] moveToY:y];
    return self;
}

- (YPFrameBuilder *)moveToView:(UIView *)view
{
    [self moveToOrigin:view.frame.origin];
    return self;
}

- (YPFrameBuilder *)moveWithOffsetX:(CGFloat)offsetX
{
    [self moveToX:self.x + offsetX];
    return self;
}

- (YPFrameBuilder *)moveWithOffsetY:(CGFloat)offsetY
{
    [self moveToY:self.y + offsetY];
    return self;
}

- (YPFrameBuilder *)moveWithOffsetX:(CGFloat)offsetX offsetY:(CGFloat)offsetY
{
    [self moveToOriginWithX:self.x + offsetX y:self.y + offsetY];
    return self;
}

#pragma mark - Resize
- (YPFrameBuilder *)setWidth:(CGFloat)width
{
    self.w = width;
    return self;
}

- (YPFrameBuilder *)setHeight:(CGFloat)height
{
    self.h = height;
    return self;
}

- (YPFrameBuilder *)setSize:(CGSize)size
{
    [self setSizeWithWidth:size.width height:size.height];
    return self;
}

- (YPFrameBuilder *)setFrame:(CGRect)frame
{
    [self moveToOrigin:frame.origin];
    [self setSize:frame.size];
    return self;
}

- (YPFrameBuilder *)setSizeWithWidth:(CGFloat)width height:(CGFloat)height
{
    [self setW:width];
    [self setH:height];
    return self;
}

- (YPFrameBuilder *)setWidthEqualToView:(UIView *)view
{
    [self setWidth:CGRectGetWidth(view.frame)];
    return self;
}

- (YPFrameBuilder *)setHeightEqualToView:(UIView *)view
{
    [self setHeight:CGRectGetHeight(view.frame)];
    return self;
}

- (YPFrameBuilder *)setSizeEqualToView:(UIView *)view
{
    [self setSize:view.frame.size];
    return self;
}

- (YPFrameBuilder *)setFrameEqualToView:(UIView *)view
{
    [self setFrame:view.frame];
    return self;
}

#pragma mark - Alignment In Superview
- (YPFrameBuilder *)alignToCenterInSuperview:(UIView *)superview
{
    [[self alignToCenterVerticallyInSuperview:superview] alignToCenterHorizontallyInSuperview:superview];
    return self;
}

- (YPFrameBuilder *)alignToCenterHorizontallyInSuperview:(UIView *)superview
{
    [self moveToX:(CGRectGetWidth(superview.bounds) - self.w) / 2];
    return self;
}

- (YPFrameBuilder *)alignToCenterVerticallyInSuperview:(UIView *)superview
{
    [self moveToY:(CGRectGetHeight(superview.bounds) - self.h) / 2];
    return self;
}

- (YPFrameBuilder *)alignToTopInSuperview:(UIView *)superview
{
    [self alignToTopInSuperview:superview offset:0.0];
    return self;
}

- (YPFrameBuilder *)alignToBottomInSuperview:(UIView *)superview
{
    [self alignToBottomInSuperview:superview offset:0.0f];
    return self;
}

- (YPFrameBuilder *)alignToLeftInSuperview:(UIView *)superview
{
    [self alignToLeftInSuperview:superview offset:0.0f];
    return self;
}

- (YPFrameBuilder *)alignRightInSuperview:(UIView *)superview
{
    [self alignToRightInSuperview:superview offset:0.0f];
    return self;
}

- (YPFrameBuilder *)fillInSuperview:(UIView *)superview
{
    [self fillInSuperview:superview insets:UIEdgeInsetsZero];
    return self;
}

- (YPFrameBuilder *)alignToTopInSuperview:(UIView *)superview offset:(CGFloat)offset
{
    [self moveToY:offset];
    return self;
}

- (YPFrameBuilder *)alignToBottomInSuperview:(UIView *)superview offset:(CGFloat)offset
{
    [self moveToY:CGRectGetHeight(superview.bounds) - self.h + offset];
    return self;
}

- (YPFrameBuilder *)alignToLeftInSuperview:(UIView *)superview offset:(CGFloat)offset
{
    [self moveToX:offset];
    return self;
}

- (YPFrameBuilder *)alignToRightInSuperview:(UIView *)superview offset:(CGFloat)offset
{
    [self moveToX:CGRectGetWidth(superview.bounds) - self.w + offset];
    return self;
}

- (YPFrameBuilder *)fillInSuperview:(UIView *)superview insets:(UIEdgeInsets)insets
{
    [self resetFrame:CGRectMake(insets.left,
                                insets.top,
                                CGRectGetWidth(superview.bounds) - insets.left - insets.right,
                                CGRectGetHeight(superview.bounds) - insets.top - insets.bottom)];
    return self;
}

#pragma mark - Alignment To View
- (YPFrameBuilder *)alignToTopOfView:(UIView *)view
{
    [self alignToTopOfView:view offset:0.0f];
    return self;
}

- (YPFrameBuilder *)alignToBottomOfView:(UIView *)view
{
    [self alignToBottomOfView:view offset:0.0f];
    return self;
}

- (YPFrameBuilder *)alignToLeftOfView:(UIView *)view
{
    [self alignToLeftOfView:view offset:0.0f];
    return self;
}

- (YPFrameBuilder *)alignToRightOfView:(UIView *)view
{
    [self alignToRightOfView:view offset:0.0f];
    return self;
}

- (YPFrameBuilder *)alignToTopOfView:(UIView *)view offset:(CGFloat)offset
{
    self.y = CGRectGetMinY(view.frame) + offset;
    return self;
}

- (YPFrameBuilder *)alignToBottomOfView:(UIView *)view offset:(CGFloat)offset
{
    self.y = CGRectGetMaxY(view.frame) - offset;
    return self;
}

- (YPFrameBuilder *)alignToLeftOfView:(UIView *)view offset:(CGFloat)offset
{
    self.x = CGRectGetMinX(view.frame) + offset;
    return self;
}

- (YPFrameBuilder *)alignToRightOfView:(UIView *)view offset:(CGFloat)offset
{
    self.x = CGRectGetMaxX(view.frame) - offset;
    return self;
}

@end
