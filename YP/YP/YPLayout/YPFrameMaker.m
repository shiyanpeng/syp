//
//  YPFrameMaker.m
//  YP
//
//  Created by syp on 15/10/30.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "YPFrameMaker.h"
#import "YPViewAttribute.h"
#import "YPViewAtrributeRelation.h"

typedef enum {
    YPLayoutOrientationHorizontally,
    YPLayoutOrientationVertically,
}YPLayoutOrientation;

@interface YPFrameMaker ()

//横向 :YPLayoutAttributeLeft,YPLayoutAttributeRight,YPLayoutAttributeWidth,YPLayoutAttributeCenterX
strongProperty YPViewAtrributeRelation *firstHorizontallyRelation;
strongProperty YPViewAtrributeRelation *secondHorizontallyRelation;
//纵向:YPLayoutAttributeTop,YPLayoutAttributeBottom,YPLayoutAttributeHeight,YPLayoutAttributeCenterY
strongProperty YPViewAtrributeRelation *firstVerticallyRelation;
strongProperty YPViewAtrributeRelation *secondVerticallyRelation;

strongProperty UIView *targetView;

@end

@implementation YPFrameMaker

- (instancetype)initWithTargetView:(UIView *)view
{
    self = [super init];
    if (self) {
        self.targetView = view;
    }
    return self;
}

- (void)applyToView
{
    CGRect frame = CGRectZero;
    [self makeFrame:&frame orientation:YPLayoutOrientationHorizontally];
    [self makeFrame:&frame orientation:YPLayoutOrientationVertically];
    self.targetView.frame = frame;
}

- (void)makeFrame:(CGRect *)frame orientation:(YPLayoutOrientation)orientation
{
    YPViewAtrributeRelation *first;
    YPViewAtrributeRelation *second;
    if (orientation == YPLayoutOrientationHorizontally) {
        first = self.firstHorizontallyRelation;
        second = self.secondHorizontallyRelation;
    }
    else {
        first = self.firstVerticallyRelation;
        second = self.secondVerticallyRelation;
    }
    
    if (!first || !second) {
        return;
    }
    CGFloat start = 0.0f;
    CGFloat span = 0.0f;
    
    [self calculateStart:&start span:&span firstRelation:first secondRelation:second];
    
    if (orientation == YPLayoutOrientationHorizontally) {
        frame->origin.x = start;
        frame->size.width = span;
    }
    else {
        frame->origin.y = start;
        frame->size.height = span;
    }
}

- (void)calculateStart:(CGFloat *)start span:(CGFloat *)span firstRelation:(YPViewAtrributeRelation *)first secondRelation:(YPViewAtrributeRelation *)second
{
    YPLayoutAttribute firstLayoutAttribute = abs((int)first.targeViewAttribute.layoutAttribute);
    YPLayoutAttribute sencondLayoutAttribute = abs((int)second.targeViewAttribute.layoutAttribute);
    
    NSAssert(firstLayoutAttribute > 0, @"firstLayoutAttribute <= 0");
    NSAssert(sencondLayoutAttribute > 0, @"sencondLayoutAttribute <= 0");
    
    CGFloat firstValue = [first toValue];
    CGFloat secondValue = [second toValue];
    
    switch (firstLayoutAttribute | sencondLayoutAttribute) {
        case YPLayoutAttributeLeft | YPLayoutAttributeRight:
            [self swapX:&firstValue andY:&secondValue ifNotEqualToAttribute:YPLayoutAttributeLeft];
            *start = firstValue;
            *span = secondValue - firstValue;
            break;
        case YPLayoutAttributeLeft | YPLayoutAttributeWidth:
            [self swapX:&firstValue andY:&secondValue ifNotEqualToAttribute:YPLayoutAttributeLeft];
            *start = firstValue;
            *span = secondValue;
            break;
        case YPLayoutAttributeLeft | YPLayoutAttributeCenterX:
            [self swapX:&firstValue andY:&secondValue ifNotEqualToAttribute:YPLayoutAttributeLeft];
            *start = firstValue;
            *span = (secondValue - firstValue) * 2;
            break;
        case YPLayoutAttributeRight | YPLayoutAttributeWidth:
            [self swapX:&firstValue andY:&secondValue ifNotEqualToAttribute:YPLayoutAttributeRight];
            *start = firstValue - secondValue;
            *span = secondValue;
            break;
        case YPLayoutAttributeRight | YPLayoutAttributeCenterX:
            [self swapX:&firstValue andY:&secondValue ifNotEqualToAttribute:YPLayoutAttributeRight];
            *start = firstValue - (firstValue - secondValue) * 2;;
            *span = (firstValue - secondValue) * 2;
            break;
        case YPLayoutAttributeWidth | YPLayoutAttributeCenterX:
            [self swapX:&firstValue andY:&secondValue ifNotEqualToAttribute:YPLayoutAttributeWidth];
            *start = secondValue - firstValue / 2;
            *span = firstValue;
            break;
        default:
            *start = 0.0f;
            *span = 0.0f;
            break;
    }
#if DEBUG
    if (*start < 0) {
        NSLog(@"warning:----------------start < 0");
    }
    if (*span <= 0) {
        NSLog(@"warning:----------------span <= 0");
    }
#endif
}

- (void)swapX:(CGFloat *)x andY:(CGFloat *)y ifNotEqualToAttribute:(YPLayoutAttribute)attribute
{
    if (abs((int)self.firstHorizontallyRelation.targeViewAttribute.layoutAttribute) != attribute) {
        CGFloat temp;
        temp = *x;
        *x = *y;
        *y = temp;
    }
}

- (YPViewAtrributeRelation *)addRelationWithLayoutAttribute:(YPLayoutAttribute)layoutAttribute
{
    if (layoutAttribute > 0) { //x方向
        return [self addRelationWithLayoutAttribute:layoutAttribute orientation:YPLayoutOrientationHorizontally];
    }
    else if (layoutAttribute < 0) {//y方向
        return [self addRelationWithLayoutAttribute:layoutAttribute orientation:YPLayoutOrientationVertically];
    }
    else {
        return nil;
    }
}

- (YPViewAtrributeRelation *)addRelationWithLayoutAttribute:(YPLayoutAttribute)layoutAttribute orientation:(YPLayoutOrientation) orientation
{
    YPViewAtrributeRelation *firstRelation;
    YPViewAtrributeRelation *secondeRelation;
    if (orientation == YPLayoutOrientationHorizontally) {
        firstRelation = self.firstHorizontallyRelation;
        secondeRelation = self.secondHorizontallyRelation;
    }
    else {
        firstRelation = self.firstVerticallyRelation;
        secondeRelation = self.secondVerticallyRelation;
    }
    
    YPViewAttribute *attribute = [[YPViewAttribute alloc] initWithView:self.targetView layoutAttribute:layoutAttribute];
    YPViewAtrributeRelation *relation = [[YPViewAtrributeRelation alloc] initWithTargeViewAttribute:attribute
                                         ];
    if (!firstRelation) {
        firstRelation = relation;
    }
    else if (!secondeRelation) {
        secondeRelation = relation;
    }
    else if (secondeRelation.targeViewAttribute.layoutAttribute == layoutAttribute) {
            secondeRelation = relation;
    }
    else {
        firstRelation = secondeRelation;
        secondeRelation = relation;
    }
    
    if (orientation == YPLayoutOrientationHorizontally) {
        self.firstHorizontallyRelation = firstRelation;
        self.secondHorizontallyRelation = secondeRelation;
    }
    else {
        self.firstVerticallyRelation = firstRelation;
        self.secondVerticallyRelation = secondeRelation;
    }
    return relation;
}

#pragma mark -

#define DefineEdgesRelationProperty(propertyName, layoutAttribute)                  \
- (YPViewAtrributeRelation *)propertyName                                           \
{                                                                                   \
    return [self addRelationWithLayoutAttribute:layoutAttribute];                   \
}                                                                                   \

DefineEdgesRelationProperty(left, YPLayoutAttributeLeft);
DefineEdgesRelationProperty(right, YPLayoutAttributeRight);
DefineEdgesRelationProperty(top, YPLayoutAttributeTop);
DefineEdgesRelationProperty(bottom, YPLayoutAttributeBottom);
DefineEdgesRelationProperty(width, YPLayoutAttributeWidth);
DefineEdgesRelationProperty(height, YPLayoutAttributeHeight);
DefineEdgesRelationProperty(centerX, YPLayoutAttributeCenterX);
DefineEdgesRelationProperty(centerY, YPLayoutAttributeCenterY);

- (void)fillToSuperView
{
    [self fillToSuperViewWithEdgeInsets:UIEdgeInsetsZero];
}
- (void)fillToSuperViewWithEdgeInsets:(UIEdgeInsets)edgeInsets
{
    self.left.equalToSuperviewLeft.offset(edgeInsets.left);
    self.right.equalToSuperviewRight.offset(-edgeInsets.right);
    self.top.equalToSuperviewTop.offset(edgeInsets.top);
    self.bottom.equalToSuperviewBottom.offset(-edgeInsets.bottom);
}

@end
