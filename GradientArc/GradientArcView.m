//
//  XXYBoardView.m
//  testPresentView
//
//  Created by yang on 12/23/15.
//  Copyright © 2015 yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XXYBoardView.h"

#define DEGREES_TO_RADIANS(angle) ((angle)/180.0*M_PI)

@implementation XXYBoardView

-(void) drawRect: (CGRect) rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    UIColor *fillColor = [UIColor colorWithRed:44.0/255.0 green:62.0/255.0 blue:80.0/255.0 alpha:1.0];
    
    CGFloat width = rect.size.width;
    CGFloat arcBorderWidth = 5;
    CGPoint center = CGPointMake(width/2, width/2);
    
    // 截取大圆
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    // 画渐变色
    UIColor *startColor = [UIColor colorWithRed:246.0/255.0 green:71.0/255.0 blue:71.0/255.0 alpha:1.0];
    UIColor *middleColor = [UIColor colorWithRed:253.0/255.0 green:188.0/255.0 blue:51.0/255.0 alpha:1.0];
    UIColor *endColor = [UIColor colorWithRed:32.0/255.0 green:197.0/255.0 blue:102.0/255.0 alpha:1.0];
    
    CGContextSaveGState(context);
    NSArray * gradientColors = @[(__bridge id)startColor.CGColor, (__bridge id)middleColor.CGColor, (__bridge id)endColor.CGColor];
    CGFloat locations[] = { 0.0, 0.4, 0.8 };
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) gradientColors, locations);
    CGPoint startPoint = CGPointMake(0, rect.size.height/2);
    CGPoint endPoint = CGPointMake(rect.size.width, rect.size.height/2);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);

    // 中间圆
    CGRect innerCircleRect = CGRectMake(arcBorderWidth, arcBorderWidth, width-arcBorderWidth*2, width-arcBorderWidth*2);
    CGContextAddEllipseInRect(context, innerCircleRect);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextFillPath(context);

    // 画弧线
    CGFloat startAngle = 0.9*M_PI;
    CGFloat endAngle = 0.1*M_PI;
    CGMutablePathRef arcPath = CGPathCreateMutable();
    CGPathAddArc(arcPath, NULL, center.x, center.y, width/2-1, startAngle, endAngle, YES);
    CGContextSetLineWidth(context, arcBorderWidth*2);
    CGContextAddPath(context, arcPath);
    CGContextSetStrokeColorWithColor(context, fillColor.CGColor);
    CGContextStrokePath(context);
    
    CGPathRelease(arcPath);
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    
}

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
