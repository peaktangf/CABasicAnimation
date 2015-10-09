//
//  CABasicAnimation+layerAnimation.h
//  CALayer的功能
//
//  Created by 谭高丰 on 15/10/7.
//  Copyright (c) 2015年 谭高丰. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CABasicAnimation (layerAnimation)

/**
 *  永久闪烁的动画
 *
 *  @param time 执行一次动画的时间

 *
 *  @return 返回一个CABasicAnimation对象
 */
+(CABasicAnimation *)opacityForever_Animation:(float)time;

/**
 *  有闪烁次数的动画
 *
 *  @param repeatTimes 动画重复的时间
 *  @param time        执行一次动画的时间
 *
 *  @return 返回一个CABasicAnimation对象
 */
+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time;

/**
 *  横向移动
 *
 *  @param time 执行一次动画的时间
 *  @param x    终点位置
 *
 *  @return 返回一个CABasicAnimation对象
 */
+(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x;


/**
 *  纵向移动
 *
 *  @param time 执行一次动画的时间
 *  @param y    终点位置
 *
 *  @return 回一个CABasicAnimation对象
 */
+(CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y;

/**
 *  缩放
 *
 *  @param toValue     目的值
 *  @param fromValue   起始值
 *  @param time        执行一次动画的时间
 *  @param repeatTimes 动画重复的时间
 *
 *  @return 返回一个CABasicAnimation对象
 */
+(CABasicAnimation *)scaleToValue:(NSNumber *)toValue fromValue:(NSNumber *)fromValue durTimes:(float)time Rep:(float)repeatTimes;


/**
 *  旋转
 *
 *  @param durTime     执行一次动画的时间
 *  @param angle       角度
 *  @param direction   方向
 *  @param repeatCount 动画重复的时间
 *
 *  @return 返回一个CABasicAnimation对象
 */
+(CABasicAnimation *)rotationDurTime:(float)durTime angle:(float)angle direction:(int)direction repeatCount:(int)repeatCount;

/**
 *  组合动画
 *
 *  @param animations  子动画数组
 *  @param time        执行一次动画的时间
 *  @param repeatTimes 动画重复的时间
 *
 *  @return 返回一个CABasicAnimation对象
 */
+(CAAnimationGroup *)groupAnimations:(NSArray *)animations durTimes:(float)time Rep:(float)repeatTimes;

@end
