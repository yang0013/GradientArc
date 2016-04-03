
//
//  GradientLineView.m
//  GradientArc
//
//  Created by 杨桂香 on 3/29/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "GradientLineView.h"

@implementation GradientLineView

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        UIImageView *imagev2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"credit_default"]];
//        [self addSubview:imagev2];
//    }
//    
//    return self;
//}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *fillColor = [UIColor whiteColor];// [UIColor colorWithRed:44.0/255.0 green:62.0/255.0 blue:80.0/255.0 alpha:1.0];
    
    CGFloat width = rect.size.width;
    CGFloat arcBorderWidth = 8;
    CGPoint center = CGPointMake(width/2, width/2);
    // 画弧线
    CGFloat startAngle = 0.25*M_PI;//M_PI;
        CGFloat endAngle = 1.75*M_PI;
        CGMutablePathRef arcPath = CGPathCreateMutable();
        CGPathAddArc(arcPath, NULL, center.x, center.y, width/2-1, startAngle, endAngle, YES);
        CGContextSetLineWidth(context, arcBorderWidth*2);
        CGContextAddPath(context, arcPath);
        CGContextSetStrokeColorWithColor(context, fillColor.CGColor);
        CGContextStrokePath(context);
    
        CGPathRelease(arcPath);
//    CGGradientRelease(gradient);
//    CGContextRestoreGState(context);
}

@end
