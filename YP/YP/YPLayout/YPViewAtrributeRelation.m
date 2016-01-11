//
//  YPViewAtrributeRelation.m
//  YP
//
//  Created by syp on 15/10/30.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "YPViewAtrributeRelation.h"

@implementation YPViewAtrributeRelation

- (id)initWithTargeViewAttribute:(YPViewAttribute *)targeViewAttribute
{
    self = [super init];
    if (self) {
        self.targeViewAttribute = targeViewAttribute;
        self.factor = 1.0f;
        self.constant = 0.0f;
    }
    return self;
}

- (CGFloat)toValue
{
    if (!self.relateViewAttribute) { //绝对布局
        return self.constant;
    }
    
    CGRect rect = CGRectZero;
    if (self.relateViewAttribute.isSuperview) {
        UIView *superview = self.targeViewAttribute.view.superview;
        if (superview) {
            rect = superview.bounds;
        }
    }
    else {
        rect = self.relateViewAttribute.view.frame;
    }
    
    CGFloat relateAttrValue = 0;
    switch (self.relateViewAttribute.layoutAttribute) {
        case YPLayoutAttributeLeft:
            relateAttrValue = rect.origin.x;
            break;
        case YPLayoutAttributeRight:
            relateAttrValue = rect.origin.x + rect.size.width;
            break;
        case YPLayoutAttributeWidth:
            relateAttrValue = rect.size.width;
            break;
        case YPLayoutAttributeCenterX:
            relateAttrValue = rect.origin.x + rect.size.width / 2;
            break;
        case YPLayoutAttributeTop:
            relateAttrValue = rect.origin.y;
            break;
        case YPLayoutAttributeBottom:
            relateAttrValue = rect.origin.y + rect.size.height;
            break;
        case YPLayoutAttributeHeight:
            relateAttrValue = rect.size.height;
            break;
        case YPLayoutAttributeCenterY:
            relateAttrValue = rect.origin.y + rect.size.height / 2;
            break;
        default:
            break;
    }
    
    return relateAttrValue * self.factor + self.constant;
}

//链式语法支持 相对布局
- (YPViewAtrributeRelation * (^)(YPViewAttribute *viewAttribute))equalTo
{
    return ^YPViewAtrributeRelation *(YPViewAttribute *viewAttribute) {
        self.relateViewAttribute = viewAttribute;
        return self;
    };
}

//#define YPViewAttributeRelation_EqualToSuperviewAttribute(attribute)                                \
//- (YPViewAtrributeRelation *)equalToSuperview##attribute                                            \
//{                                                                                                   \
//    UIView *superview = self.targeViewAttribute.view.superview;                                     \
//    self.relateViewAttribute = [[YPViewAttribute alloc] initWithView:superview                      \
//                                                     layoutAttribute:YPLayoutAttribute##attribute   \
//                                                         isSuperview:YES];                          \
//    return self;                                                                                    \
//}                                                                                                   \



#define YPViewAttributeRelation_EqualToSuperviewAttribute(attribute)                                    \
- (YPViewAtrributeRelation * (^)(void))equalToSuperview##attribute                                      \
{                                                                                                       \
    return ^YPViewAtrributeRelation *(void) {                                                           \
        UIView *superview = self.targeViewAttribute.view.superview;                                     \
        self.relateViewAttribute = [[YPViewAttribute alloc] initWithView:superview                      \
                                                         layoutAttribute:YPLayoutAttribute##attribute   \
                                                             isSuperview:YES];                          \
        return self;                                                                                    \
    };                                                                                                  \
}                                                                                                       \

YPViewAttributeRelation_EqualToSuperviewAttribute(Left)
YPViewAttributeRelation_EqualToSuperviewAttribute(Right)
YPViewAttributeRelation_EqualToSuperviewAttribute(Top)
YPViewAttributeRelation_EqualToSuperviewAttribute(Bottom)
YPViewAttributeRelation_EqualToSuperviewAttribute(Width)
YPViewAttributeRelation_EqualToSuperviewAttribute(Height)
YPViewAttributeRelation_EqualToSuperviewAttribute(CenterX)
YPViewAttributeRelation_EqualToSuperviewAttribute(CenterY)

- (YPViewAtrributeRelation * (^)(CGFloat factor))multipliedBy
{
    return ^YPViewAtrributeRelation *(CGFloat factor) {
        self.factor = factor;
        return self;
    };
}

- (YPViewAtrributeRelation * (^)(CGFloat offset))offset
{
    return ^YPViewAtrributeRelation *(CGFloat offset) {
        self.constant = offset;
        return self;
    };
}

//绝对布局
- (void(^)(CGFloat value))setValue
{
    return ^void(CGFloat value) {
        self.constant = value;
        self.relateViewAttribute = nil;
    };
}

@end
