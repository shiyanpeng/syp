//
//  UIColor+Utility.m
//  YP
//
//  Created by syp on 15/10/28.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "UIColor+Utility.h"

@implementation UIColor(Utility)
+ (UIColor *)fromHexValue:(NSUInteger)hex
{
    NSUInteger a = ((hex >> 24) & 0x000000FF);
    float fa = ((0 == a) ? 1.0f : (a * 1.0f) / 255.0f);
    
    return [UIColor fromHexValue:hex alpha:fa];
}

+ (UIColor *)fromHexValue:(NSUInteger)hex alpha:(CGFloat)alpha
{
    NSUInteger r = ((hex >> 16) & 0x000000FF);
    NSUInteger g = ((hex >> 8) & 0x000000FF);
    NSUInteger b = ((hex >> 0) & 0x000000FF);
    
    float fr = (r * 1.0f) / 255.0f;
    float fg = (g * 1.0f) / 255.0f;
    float fb = (b * 1.0f) / 255.0f;
    
    return [UIColor colorWithRed:fr green:fg blue:fb alpha:alpha];
}

+ (UIColor *)fromShortHexValue:(NSUInteger)hex
{
    return [UIColor fromShortHexValue:hex alpha:1.0f];
}

+ (UIColor *)fromShortHexValue:(NSUInteger)hex alpha:(CGFloat)alpha
{
    NSUInteger r = ((hex >> 8) & 0x0000000F);
    NSUInteger g = ((hex >> 4) & 0x0000000F);
    NSUInteger b = ((hex >> 0) & 0x0000000F);
    
    float fr = (r * 1.0f) / 15.0f;
    float fg = (g * 1.0f) / 15.0f;
    float fb = (b * 1.0f) / 15.0f;
    
    return [UIColor colorWithRed:fr green:fg blue:fb alpha:alpha];
}
@end
