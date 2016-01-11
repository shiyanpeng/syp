//
//  UIView.h
//  YP
//
//  Created by syp on 15/10/28.
//  Copyright © 2015年 syp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YPPropertyMacro.h"

@interface UIView (Frame)
//距离superview的边界
readonlyProperty CGFloat left;
readonlyProperty CGFloat top;
readonlyProperty CGFloat right;
readonlyProperty CGFloat bottom;

readonlyProperty CGFloat width;
readonlyProperty CGFloat height;
readonlyProperty CGPoint origin;
readonlyProperty CGSize  size;
readonlyProperty CGFloat centerX;
readonlyProperty CGFloat centerY;

@end
