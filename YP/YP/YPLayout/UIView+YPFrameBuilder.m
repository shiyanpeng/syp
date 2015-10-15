//
//  UIView+YPFrameBuilder.m
//  DemoApp
//
//  Created by syp on 15/10/6.
//  Copyright (c) 2015年 Citrix Systems, Inc. All rights reserved.
//

#import "UIView+YPFrameBuilder.h"

@implementation UIView (YPFrameBuilder)

- (void)buildFrame:(buildFrameBlock)buildFrameBlock
{
    YPFrameBuilder *builder = [[YPFrameBuilder alloc] initWithFrame:self.frame];
    buildFrameBlock(builder);
    self.frame = builder.frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)right
{
    return self.left + self.width;
}

- (CGFloat)bottom
{
    return self.top + self.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGSize)size
{
    return self.frame.size;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

+ (UILabel *)createLabelWith:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment superView:(UIView *)superView frame:(buildFrameBlock)block
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    [superView addSubview:label];
    
    [label buildFrame:block];
    
    return label;
}
+ (UILabel *)createMutiLinesLabelWith:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment superView:(UIView *)superView frame:(buildFrameBlock)block
{
    UILabel *label = [UIView createLabelWith:text fontSize:fontSize textColor:textColor textAlignment:textAlignment superView:superView frame:block];
    label.numberOfLines = 0;
    return label;
}
+ (UILabel *)createSizeToFitLabelWith:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment superView:(UIView *)superView frame:(buildFrameBlock)block
{
    UILabel *label = [UIView createLabelWith:text fontSize:fontSize textColor:textColor textAlignment:textAlignment superView:superView frame:block];
    [label sizeToFit];
    return label;
}

@end
