//
//  AnimationViewController.m
//  CABasicAnimation的分类
//
//  Created by 谭高丰 on 15/10/7.
//  Copyright (c) 2015年 谭高丰. All rights reserved.
//

#import "AnimationViewController.h"
#import "CABasicAnimation+layerAnimation.h"
#import <UIView+AutoLayout.h>

@interface AnimationViewController ()
@property (nonatomic, strong) CALayer *imageLayer;
@property (nonatomic, copy) NSArray *arr;
@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建一个UIView容器
    UIView *subView = [[UIView alloc] init];
    [self.view addSubview:subView];
    [subView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:50.0f];
    [subView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:50.0f];
    [subView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:200.0f];
    [subView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:200.0f];
    
    //提前获得subView autolayout适配后的真实frame
    [subView setNeedsLayout];
    [subView layoutIfNeeded];
    
    //创建对应的layer
    self.imageLayer = [CALayer layer];
    self.imageLayer.frame = CGRectMake(0, 0, subView.bounds.size.width,subView.bounds.size.height);
    self.imageLayer.backgroundColor = [UIColor redColor].CGColor;
    [subView.layer addSublayer:self.imageLayer];
    
    CABasicAnimation *flickerAnimation = [CABasicAnimation opacityForever_Animation:0.1];
    CABasicAnimation *moveAnimation = [CABasicAnimation moveX:1 X:[NSNumber numberWithFloat:300.f]];
    CABasicAnimation *scaleAnimation = [CABasicAnimation scaleToValue:[NSNumber numberWithFloat:1.5] fromValue:[NSNumber numberWithFloat:1] durTimes:1 Rep:10];
    CABasicAnimation *rotationAnimation = [CABasicAnimation rotationDurTime:1 angle:180.f direction:-1 repeatCount:100];
    NSLog(@"%d",self.sign);
    switch (self.sign)
    {
        case 0:
            [self.imageLayer addAnimation:flickerAnimation forKey:nil];
            break;
        case 1:
            [self.imageLayer addAnimation:moveAnimation forKey:nil];
            break;
        case 2:
            [self.imageLayer addAnimation:scaleAnimation forKey:nil];
            break;
        case 3:
            [self.imageLayer addAnimation:rotationAnimation forKey:nil];
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
