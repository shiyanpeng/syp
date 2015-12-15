//
//  YPViewAtrributeRelation.h
//  YP
//
//  Created by syp on 15/10/30.
//  Copyright © 2015年 syp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YPCore.h"
#import "YPViewAttribute.h"

@interface YPViewAtrributeRelation : NSObject

strongProperty YPViewAttribute *targeViewAttribute;
strongProperty YPViewAttribute *relateViewAttribute;
assignProperty CGFloat factor;
assignProperty CGFloat constant;

- (id)initWithTargeViewAttribute:(YPViewAttribute *)targeViewAttribute;

- (CGFloat)toValue;

//链式语法支持 相对布局
- (YPViewAtrributeRelation * (^)(YPViewAttribute *viewAttribute))equalTo;
- (YPViewAtrributeRelation *)equalToSuperviewLeft;
- (YPViewAtrributeRelation *)equalToSuperviewRight;
- (YPViewAtrributeRelation *)equalToSuperviewTop;
- (YPViewAtrributeRelation *)equalToSuperviewBottom;
- (YPViewAtrributeRelation *)equalToSuperviewWidth;
- (YPViewAtrributeRelation *)equalToSuperviewHeight;
- (YPViewAtrributeRelation *)equalToSuperviewCenterX;
- (YPViewAtrributeRelation *)equalToSuperviewCenterY;
- (YPViewAtrributeRelation * (^)(CGFloat multiplier))multipliedBy;
- (YPViewAtrributeRelation * (^)(CGFloat offset))offset;
//绝对布局
- (void(^)(CGFloat value))setValue;

@end
