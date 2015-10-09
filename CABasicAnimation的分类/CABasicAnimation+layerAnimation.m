//
//  CABasicAnimation+layerAnimation.m
//  CALayer的功能
//
//  Created by 谭高丰 on 15/10/7.
//  Copyright (c) 2015年 谭高丰. All rights reserved.
//

#import "CABasicAnimation+layerAnimation.h"

@implementation CABasicAnimation (layerAnimation)

+(CABasicAnimation *)opacityForever_Animation:(float)time //永久闪烁
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    animation.toValue=[NSNumber numberWithFloat:0.0];
    animation.autoreverses=YES;
    animation.duration=time;
    animation.repeatCount=FLT_MAX;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}

+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time; //有次数的闪烁
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    animation.toValue=[NSNumber numberWithFloat:0.4];
    animation.repeatCount=repeatTimes;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.autoreverses=YES;
    return  animation;
}

+(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x //横向移动
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.toValue=x;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}

+(CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y //纵向移动
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.toValue=y;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}


+(CABasicAnimation *)scaleToValue:(NSNumber *)toValue fromValue:(NSNumber *)fromValue durTimes:(float)time Rep:(float)repeatTimes //缩放
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue=fromValue;
    animation.toValue=toValue;
    animation.duration=time;
    animation.autoreverses=YES;
    animation.repeatCount=repeatTimes;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}

+(CABasicAnimation *)rotationDurTime:(float)durTime angle:(float)angle direction:(int)direction repeatCount:(int)repeatCount //旋转
{
    CATransform3D rotationTransform  = CATransform3DMakeRotation(angle, 0, 0,direction);
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue= [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration= durTime;
    animation.cumulative= YES;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.repeatCount= repeatCount;
    animation.delegate= self;
    return animation;
}

+(CAAnimationGroup *)groupAnimations:(NSArray *)animations durTimes:(float)time Rep:(float)repeatTimes //组合动画
{
    CAAnimationGroup *animation=[CAAnimationGroup animation];
    animation.animations=animations;
    animation.duration=time;
    animation.repeatCount=repeatTimes;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}

@end
