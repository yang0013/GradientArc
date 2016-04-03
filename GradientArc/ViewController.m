//
//  ViewController.m
//  GradientArc
//
//  Created by yang on 1/1/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "GradientArcView.h"
#import "GradientLineView.h"
#import "BezierPathView.h"
#import "UIColor+Helper.h"
#import "CreditButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];//  [UIColor colorWithRed:44.0/255.0 green:62.0/255.0 blue:80.0/255.0 alpha:1.0];
    CGFloat pargin = 48;
    CGFloat width = self.view.frame.size.width;
        XXYBoardView *boardView = [[XXYBoardView alloc] initWithFrame:CGRectMake(pargin, 100, width-2*pargin, width-2*pargin)];
        boardView.backgroundColor = [UIColor colorWithRed:44.0/255.0 green:62.0/255.0 blue:80.0/255.0 alpha:1.0];
        [self.view addSubview:boardView];
    
    BezierPathView *v1 = [[BezierPathView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 270)];
//    [self.view addSubview:v1];
//
//     UIImageView *imagev2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"credit_default"]];
//     UIImageView *imagev1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"credit_colorful"]];

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 200, 100)];
//    view.backgroundColor = [UIColor redColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
   
    [button setTitle:@"中智诚" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRGBA:0x999999 alpha:1.0] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:@"button_credit_bg_default"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"button_credit_bg_high_sel"] forState:UIControlStateSelected];
    [button setImage:[[UIImage imageNamed:@"button_credit_high"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"button_credit_high"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionTap:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(34, -20, 0, 20)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 22, 20, 22)];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.tintColor = [UIColor whiteColor];
    
    [view addSubview:button];
    [self.view addSubview:view];

}

- (void)createButtonWithTitle:(NSString *)title Type:(NSInteger)type {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRGBA:0x999999 alpha:1.0] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:@"button_credit_bg_default"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"button_credit_bg_high_sel"] forState:UIControlStateSelected];
    
    [button setImage:[[UIImage imageNamed:@"button_credit_high"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"button_credit_high"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionTap:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(34, -20, 0, 20)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 22, 20, 22)];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.tintColor = [UIColor whiteColor];
}

- (void)actionTap:(UIButton *)button {
    button.selected = !button.selected;
}

- (void)bezierPath {
    
    //     NSBezierPath *path = [[NSBezierPath alloc] init];
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    //    v1.backgroundColor = [UIColor redColor];
    [self.view addSubview:v1];
    
    //    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    //    shape.frame = v1.bounds;
    //
    UIBezierPath* p = [UIBezierPath new];
    
    CGRect circleRect = CGRectInset(v1.bounds, 40, 40);
    p = [UIBezierPath bezierPathWithRoundedRect:circleRect cornerRadius:2.0];
    
    //    shape.path = p.CGPath;
    //    shape.strokeColor = [UIColor blackColor].CGColor;
    //    shape.lineWidth = 5;
    //    shape.fillColor = nil;
    
    CAGradientLayer* grad = [[CAGradientLayer alloc] init];
    grad.frame = v1.bounds;
    grad.colors = @[(id)[UIColor blueColor].CGColor,
                    (id)[UIColor yellowColor].CGColor];
    
    CAShapeLayer* mask = [[CAShapeLayer alloc] init];
    mask.frame = v1.bounds;
    mask.path = p.CGPath;
    mask.fillColor = [UIColor blackColor].CGColor;
    grad.mask = mask;
    
    [v1.layer addSublayer:grad];
    //    [v1.layer addSublayer:shape];
    //
    //    return;

}

- (void)replicatorLayer {
    
    // replicator layer
    //    UIView *layerView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    //    layerView.backgroundColor = [UIColor blueColor];
    UIView *layerView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame              = CGRectMake(0, 0, 100, 100);
    replicatorLayer.position           = CGPointMake(50, 50);
    replicatorLayer.backgroundColor    = [UIColor clearColor].CGColor;
    //    replicatorLayer.instanceCount = 3;
    //    replicatorLayer.instanceDelay = (1 / 30.0)
    replicatorLayer.preservesDepth = false;
    //    replicatorLayer.instanceColor = UIColor.whiteColor().CGColor
    
    replicatorLayer.instanceCount      = 10;
    CGFloat angle = (M_PI * 2.0) / 30;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
    replicatorLayer.instanceDelay      = 0.33f;
    
    CALayer *instanceLayer = [[CALayer alloc] init];
    CGFloat layerWidth = 5.0;
    CGFloat midX = CGRectGetMidX(layerView.bounds) - layerWidth / 2.0;
    instanceLayer.frame = CGRectMake(midX, 0.0, layerWidth, layerWidth * 3.0);
    instanceLayer.backgroundColor = [ UIColor redColor].CGColor;
    instanceLayer.cornerRadius = 2.0;
    
    [replicatorLayer addSublayer:instanceLayer];
    
    [layerView.layer addSublayer:replicatorLayer];
    
    replicatorLayer.transform = CATransform3DMakeRotation(M_PI*.2, 0, 0, 1.0);
    [self.view addSubview:layerView];

}
- (void)drawImage:(UIView *)view {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    UIImage *inputImage = [UIImage imageNamed:@"icon_watermark"];
//    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, [UIScreen mainScreen].scale);
//    
//    //    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [view.layer renderInContext:context];
//    
//    CGFloat offsetY = view.bounds.size.height -30;
////    CGFloat offsetX = (view.bounds.size.width - inputImage.size.width)/2;
////    [inputImage drawAtPoint:CGPointMake(offsetX, offsetY)];
//    
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
