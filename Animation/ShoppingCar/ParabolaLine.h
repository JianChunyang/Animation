//
//  ParabolaLine.h
//  Animation
//
//  Created by chun on 2017/7/22.
//  Copyright © 2017年 chun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef void (^AnimatonCompletion)(void);
@interface ParabolaLine : NSObject
@property (nonatomic, strong) UIView *throwWiew;
@property (nonatomic, copy) AnimatonCompletion animationCompletion;

+ (ParabolaLine *)sharedInstence;

/**
 *  将某个view或者layer从起点抛到终点
 *
 *  @param view     被抛的物体
 *  @param start    起点坐标
 *  @param end      终点坐标
 *  @param endScale 终点view大小
 */
- (void)throwView:(UIView *)view from:(CGPoint)start to:(CGPoint)end endScale:(CGFloat )endScale;


/**
 *  将某个view或者layer从起点抛到终点
 *
 *
 *  @param view         被抛的物体(图片)
 *  @param path         贝赛尔曲线
 *  @param endScale     终点view大小
 *  @param isRotation   是否旋转
 */
- (void)throwView:(UIView *)view path:(UIBezierPath *)path rotaion:(BOOL)isRotation endScale:(CGFloat)endScale;
@end
