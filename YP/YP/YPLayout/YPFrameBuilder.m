//
//  YPFrameBuilder.m
//  DemoApp
//
//  Created by syp on 15/10/6.
//  Copyright (c) 2015年 Citrix Systems, Inc. All rights reserved.
//

#import "YPFrameBuilder.h"


typedef enum {
    YPFrameBuilderAlignOrientationLeft,
    YPFrameBuilderAlignOrientationTop,
    YPFrameBuilderAlignOrientationRight,
    YPFrameBuilderAlignOrientationBottom,
    YPFrameBuilderAlignOrientationCenterHorizontally,
    YPFrameBuilderAlignOrientationCenterVertically,
}YPFrameBuilderAlignOrientation;

@interface YPFrameBuilder ()

strongProperty UIView *view;

assignProperty CGFloat x;
assignProperty CGFloat y;
assignProperty CGFloat w;
assignProperty CGFloat h;

@end

@implementation YPFrameBuilder

#pragma mark - init

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self) {
        self.view = view;
    }
    return self;
}

- (YPFrameBuilder *)reset
{
    CGRect frame = self.view.frame;
    _x = frame.origin.x;
    _y = frame.origin.y;
    _w = frame.size.width;
    _h = frame.size.height;
    return self;
}

- (YPFrameBuilder *)apply
{
    self.view.frame = CGRectMake(self.x, self.y, self.w, self.h);
    return self;
}

#pragma mark - set left&right

- (YPFrameBuilder *)setLeft:(CGFloat)left
{
    return [self setOrigin:CGPointMake(left, self.y)];
}

- (YPFrameBuilder *)setTop:(CGFloat)top
{
    return [self setOrigin:CGPointMake(self.x, top)];
}

- (YPFrameBuilder *)setRight:(CGFloat)right
{
    return [self setOrigin:CGPointMake(self.view.superview.bounds.size.width - right - self.w, self.y)];
}
- (YPFrameBuilder *)setBottom:(CGFloat)bottom
{
    return [self setOrigin:CGPointMake(self.x, self.view.superview.bounds.size.height - bottom - self.h)];
}

- (YPFrameBuilder *)setOrigin:(CGPoint)origin
{
    self.x = origin.x;
    self.y = origin.y;
    return self;
}

- (YPFrameBuilder *)setOriginEqualToView:(UIView *)view
{
    [self setOrigin:view.frame.origin];
    return self;
}

#pragma mark - move

- (YPFrameBuilder *)moveHorizontallyOffset:(CGFloat)offset;
{
    self.x += offset;
    return self;
}

- (YPFrameBuilder *)moveVerticallyOffset:(CGFloat)offset;
{
    self.y += offset;
    return self;
}

#pragma mark - Resize

- (YPFrameBuilder *)setWidth:(CGFloat)width
{
    return [self setSize:CGSizeMake(width, self.h)];
}

- (YPFrameBuilder *)setHeight:(CGFloat)height
{
    return [self setSize:CGSizeMake(self.w, height)];
}

- (YPFrameBuilder *)setSize:(CGSize)size
{
    self.w = size.width;
    self.h = size.height;
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

#pragma mark - Alignment In Superview
- (YPFrameBuilder *)alignToCenterInSuperview
{
    return [[self alignToCenterVerticallyInSuperview] alignToCenterHorizontallyInSuperview];
}

- (YPFrameBuilder *)alignToCenterHorizontallyInSuperview
{
    return [self alignInSuperviewOnOrientation:YPFrameBuilderAlignOrientationCenterHorizontally];
}

- (YPFrameBuilder *)alignToCenterVerticallyInSuperview
{
    return [self alignInSuperviewOnOrientation:YPFrameBuilderAlignOrientationCenterVertically];
}

- (YPFrameBuilder *)alignToTopInSuperview
{
    return [self alignInSuperviewOnOrientation:YPFrameBuilderAlignOrientationTop];
}

- (YPFrameBuilder *)alignToBottomInSuperview
{
    return [self alignInSuperviewOnOrientation:YPFrameBuilderAlignOrientationBottom];
}

- (YPFrameBuilder *)alignToLeftInSuperview
{
    return [self alignInSuperviewOnOrientation:YPFrameBuilderAlignOrientationLeft];
}

- (YPFrameBuilder *)alignRightInSuperview
{
    return [self alignInSuperviewOnOrientation:YPFrameBuilderAlignOrientationRight];
}

- (YPFrameBuilder *)alignInSuperviewOnOrientation:(int)orientation
{
    UIView *superView = self.view.superview;
    NSAssert(!superView, @"please add subview first.");
    if (superView) {
        switch (orientation) {
            case YPFrameBuilderAlignOrientationLeft: //left
                [self setLeft:0]; 
                break;
            case YPFrameBuilderAlignOrientationTop: //top
                [self setTop:0];
                break;
            case YPFrameBuilderAlignOrientationRight: //right
                [self setLeft:superView.bounds.size.width - self.w];
                break;
            case YPFrameBuilderAlignOrientationBottom: //bottom
                [self setTop:superView.bounds.size.height - self.h];
                break;
            case YPFrameBuilderAlignOrientationCenterHorizontally:
                [self setLeft:(CGRectGetWidth(superView.bounds) - self.w) / 2];
                break;
            case YPFrameBuilderAlignOrientationCenterVertically:
                [self setTop:(CGRectGetHeight(superView.bounds) - self.h) / 2];
                break;
            default:
                break;
        }
    }
    return self;
}

//fill
- (YPFrameBuilder *)fillInSuperview:(UIView *)superview
{
    return [[self setOrigin:superview.bounds.origin] setSize:superview.bounds.size];
}

#pragma mark - Alignment To View

- (YPFrameBuilder *)alignToTopOfView:(UIView *)view
{
    return [self setTop:view.top];
}

- (YPFrameBuilder *)alignToBottomOfView:(UIView *)view
{
    return [self setBottom:view.bottom];
}

- (YPFrameBuilder *)alignToLeftOfView:(UIView *)view
{
    return [self setLeft:view.left];
}

- (YPFrameBuilder *)alignToRightOfView:(UIView *)view
{
    return [self setRight:view.right];
}

#pragma mark - near
- (YPFrameBuilder *)nearToTopOfView:(UIView *)view
{
    return self;
}

- (YPFrameBuilder *)nearToBottomOfView:(UIView *)view
{
    return self;
}

- (YPFrameBuilder *)nearToLeftOfView:(UIView *)view
{
    return self;
}

- (YPFrameBuilder *)nearToRightOfView:(UIView *)view
{
    return self;
}

#pragma mark - properties
#define DefineBlockProperty(BlockType,BlockArgType,propertyName)     \
- (BlockType)propertyName                                            \
{                                                                   \
    BlockType block = ^(BlockArgType arg) {                         \
        return [self propertyName:arg];                              \
    };                                                              \
    return block;                                                   \
}
#define DefineCGFloatBlockProperty(propertyName) DefineBlockProperty(Block_CGFloatArg,CGFloat,propertyName)
#define DefineUIViewBlockProperty(propertyName) DefineBlockProperty(Block_UIViewArg,UIView*,propertyName)

DefineCGFloatBlockProperty(setLeft)
DefineCGFloatBlockProperty(setTop)
DefineCGFloatBlockProperty(setRight)
DefineCGFloatBlockProperty(setBottom)

@end
