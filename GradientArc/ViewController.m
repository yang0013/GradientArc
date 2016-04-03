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
#import "BezierPathView.h"
#import "UIColor+Helper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];//  [UIColor colorWithRed:44.0/255.0 green:62.0/255.0 blue:80.0/255.0 alpha:1.0];
    CGFloat pargin = 48;
    CGFloat width = self.view.frame.size.width;
    XXYBoardView *boardView = [[XXYBoardView alloc] initWithFrame:CGRectMake(pargin, 20, width-2*pargin, width-2*pargin)];
    boardView.backgroundColor = [UIColor colorWithRed:44.0/255.0 green:62.0/255.0 blue:80.0/255.0 alpha:1.0];
    [self.view addSubview:boardView];
    
    BezierPathView *v1 = [[BezierPathView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 270)];
    [self.view addSubview:v1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
