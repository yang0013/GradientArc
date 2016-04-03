//
//  BezierPathView.m
//  GradientArc
//
//  Created by 杨桂香 on 3/30/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import "BezierPathView.h"
#import <CoreGraphics/CoreGraphics.h>
#import "UIColor+Helper.h"

#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)
static CGFloat const kCircleDiameter = 230;

@interface BezierPathView()
@property (nonatomic) CGFloat startDegree;
@property (nonatomic) CGFloat endDegree;
@property (nonatomic) CGFloat minValue;
@property (nonatomic) CGFloat maxValue;
@property (nonatomic) CGFloat value;
@property (nonatomic) CGFloat dividedStep;
@property (nonatomic) CGFloat totalSteps;
@property (nonatomic, strong) UIColor *levelColor;
@end

@implementation BezierPathView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _startDegree = -130;
        _endDegree = 130;
        _dividedStep = 31;
        _totalSteps = 31;
        _levelColor = [UIColor colorWithRed:32.0/255.0 green:197.0/255.0 blue:102.0/255.0 alpha:1.0];
        _minValue = 500;
        _maxValue = 900;
        
        self.backgroundColor = [UIColor colorWithRed:44.0/255.0 green:62.0/255.0 blue:80.0/255.0 alpha:1.0];//[UIColor whiteColor];
    }
    
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGRect circleRect;
    if (rect.size.width > kCircleDiameter) {
        circleRect = CGRectInset(rect, (rect.size.width-kCircleDiameter)/2, 20);
    } else {
        circleRect = CGRectInset(rect, 20, 20);
    }
    
//    CGFloat radius = MIN(circleRect.size.width, circleRect.size.height)/2;
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);

    CGFloat step = self.dividedStep;
    CGFloat stepDegree = (self.endDegree-self.startDegree)/(self.totalSteps-1);
    CGFloat squareWidth = 4;
    CGRect squareRect = CGRectMake((rect.size.width-squareWidth)/2, 20, squareWidth, 13);// CGRectInset(rect, rect.size.width*0.45, rect.size.height*.05);
    for (int i=0; i<step; i++) {
        UIBezierPath *squarePath = [UIBezierPath bezierPathWithRoundedRect:squareRect cornerRadius:squareWidth/2];

        NSInteger degreeToRotate = self.startDegree+i*stepDegree;
        // 变换坐标
        [squarePath applyTransform:CGAffineTransformMakeTranslation(-center.x, -center.y)];
        // 旋转
        [squarePath applyTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degreeToRotate))];
        // 还原坐标
        [squarePath applyTransform:CGAffineTransformMakeTranslation(center.x, center.y)];

        [path appendPath:squarePath];
    }
    
//    [[UIColor redColor] setFill];
//     [path fill];
//
    
    CAGradientLayer* grad = [[CAGradientLayer alloc] init];
    grad.frame = rect;
    grad.colors = @[(id)[UIColor colorWithRed:246.0/255.0 green:71.0/255.0 blue:71.0/255.0 alpha:1.0].CGColor,
                    (id)[UIColor colorWithRed:253.0/255.0 green:188.0/255.0 blue:51.0/255.0 alpha:1.0].CGColor,
                    (id)[UIColor colorWithRed:32.0/255.0 green:197.0/255.0 blue:102.0/255.0 alpha:1.0].CGColor];

    grad.startPoint = CGPointMake(0, 0);
    grad.endPoint = CGPointMake(1, 0);
    grad.locations = @[@0.15, @0.55, @0.8];
   
    CAShapeLayer* mask = [[CAShapeLayer alloc] init];
    mask.frame = rect;
    mask.path = path.CGPath;
    mask.fillColor = [UIColor blackColor].CGColor;
    grad.mask = mask;
    
    [self.layer addSublayer:grad];

     [[UIColor lightGrayColor] setFill];
    for (int i=step; i<self.totalSteps; i++) {
        UIBezierPath *squarePath = [UIBezierPath bezierPathWithRoundedRect:squareRect cornerRadius:squareWidth/2];
        
        NSInteger degreeToRotate = self.startDegree+i*stepDegree;
        [squarePath applyTransform:CGAffineTransformMakeTranslation(-center.x, -center.y)];
        // rotate it 90 degrees
        [squarePath applyTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degreeToRotate))];
        // now move it back so that the top left of its bounding box is (0,0)
        [squarePath applyTransform:CGAffineTransformMakeTranslation(center.x, center.y)];
        //    [squarePath applyTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degreeToRotate))];
        
        //    [squarePath appendPath:circlePath];
        [squarePath fill];
        [path appendPath:squarePath];
    }
}


@end
