//
//  UIColor+Helper.m
//  ourtravel
//
//  Created by yang on 14-9-5.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#import "UIColor+Helper.h"

@implementation UIColor (Helper)

+ (UIColor *)colorWithRGBA:(NSUInteger)color alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((color >> 16) & 0xFF) / 255.0f
                           green:((color >> 8) & 0xFF) / 255.0f
                            blue:((color) & 0xFF) / 255.0f
                           alpha:alpha];
}

@end
