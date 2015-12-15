//
//  UIView+YPFrameMaker.h
//  YP
//
//  Created by syp on 15/10/30.
//  Copyright © 2015年 syp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YPCore.h"
#import "YPFrameMaker.h"
#import "YPViewAttribute.h"


@interface UIView(YPFrameMaker)

readonlyProperty YPViewAttribute *left;
readonlyProperty YPViewAttribute *top;
readonlyProperty YPViewAttribute *right;
readonlyProperty YPViewAttribute *bottom;
readonlyProperty YPViewAttribute *width;
readonlyProperty YPViewAttribute *height;
readonlyProperty YPViewAttribute *centerX;
readonlyProperty YPViewAttribute *centerY;

- (void)makeFrame:(void(^)(YPFrameMaker *make))block;

@end
