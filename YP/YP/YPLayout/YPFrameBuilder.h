//
//  YPFrameBuilder.h
//  DemoApp
//
//  Created by syp on 15/10/6.
//  Copyright (c) 2015年 Citrix Systems, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YPCore.h"

@class YPFrameBuilder;
typedef YPFrameBuilder *(^Block_NonArgs)();
typedef YPFrameBuilder *(^Block_CGFloatArg)(CGFloat);
typedef YPFrameBuilder *(^Block_UIViewArg)(UIView *);
typedef YPFrameBuilder *(^Block_CGSizeArg)(CGSize);
typedef YPFrameBuilder *(^Block_CGRectArg)(CGSize);


@interface YPFrameBuilder : NSObject

readonlyProperty Block_CGFloatArg setLeft;
readonlyProperty Block_CGFloatArg setTop;
readonlyProperty Block_CGFloatArg setRight;
readonlyProperty Block_CGFloatArg setBottom;

- (instancetype)initWithView:(UIView *)view;

- (YPFrameBuilder *)reset;
- (YPFrameBuilder *)apply;

//set left&top
- (YPFrameBuilder *)setLeft:(CGFloat)left;
- (YPFrameBuilder *)setTop:(CGFloat)top;
- (YPFrameBuilder *)setRight:(CGFloat)right;
- (YPFrameBuilder *)setBottom:(CGFloat)bottom;
- (YPFrameBuilder *)setOrigin:(CGPoint)origin;
- (YPFrameBuilder *)setOriginEqualToView:(UIView *)view;

// move
- (YPFrameBuilder *)moveHorizontallyOffset:(CGFloat)offset;
- (YPFrameBuilder *)moveVerticallyOffset:(CGFloat)offset;

// Resize
- (YPFrameBuilder *)setWidth:(CGFloat)width;
- (YPFrameBuilder *)setHeight:(CGFloat)height;
- (YPFrameBuilder *)setSize:(CGSize)size;
- (YPFrameBuilder *)setWidthEqualToView:(UIView *)view;
- (YPFrameBuilder *)setHeightEqualToView:(UIView *)view;
- (YPFrameBuilder *)setSizeEqualToView:(UIView *)view;

//Alignment
- (YPFrameBuilder *)alignToCenterInSuperview;
- (YPFrameBuilder *)alignToCenterHorizontallyInSuperview;
- (YPFrameBuilder *)alignToCenterVerticallyInSuperview;

- (YPFrameBuilder *)alignToTopInSuperview;
- (YPFrameBuilder *)alignToBottomInSuperview;
- (YPFrameBuilder *)alignToLeftInSuperview;
- (YPFrameBuilder *)alignRightInSuperview;

- (YPFrameBuilder *)alignToTopOfView:(UIView *)view;
- (YPFrameBuilder *)alignToBottomOfView:(UIView *)view;
- (YPFrameBuilder *)alignToLeftOfView:(UIView *)view;
- (YPFrameBuilder *)alignToRightOfView:(UIView *)view;

//near
- (YPFrameBuilder *)nearToTopOfView:(UIView *)view;
- (YPFrameBuilder *)nearToBottomOfView:(UIView *)view;
- (YPFrameBuilder *)nearToLeftOfView:(UIView *)view;
- (YPFrameBuilder *)nearToRightOfView:(UIView *)view;


//fill
- (YPFrameBuilder *)fillInSuperview:(UIView *)superview;

@end
