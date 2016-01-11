//
//  YPFrameMaker.h
//  YP
//
//  Created by syp on 15/10/30.
//  Copyright © 2015年 syp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YPCore.h"
#import "YPViewAtrributeRelation.h"


@interface YPFrameMaker : NSObject

readonlyProperty YPViewAtrributeRelation *left;
readonlyProperty YPViewAtrributeRelation *top;
readonlyProperty YPViewAtrributeRelation *right;
readonlyProperty YPViewAtrributeRelation *bottom;
readonlyProperty YPViewAtrributeRelation *width;
readonlyProperty YPViewAtrributeRelation *height;
readonlyProperty YPViewAtrributeRelation *centerX;
readonlyProperty YPViewAtrributeRelation *centerY;

- (void)fillToSuperView;
- (void)fillToSuperViewWithEdgeInsets:(UIEdgeInsets)edgeInsets;

- (instancetype)initWithTargetView:(UIView *)view;
- (void)applyToView;

@end
