//
//  ParabolaLine.m
//  Animation
//
//  Created by chun on 2017/7/22.
//  Copyright © 2017年 chun. All rights reserved.
//

#import "ParabolaLine.h"



static ParabolaLine *parabola;

@interface ParabolaLine () <CAAnimationDelegate>

@end

@implementation ParabolaLine

- (instancetype)init
{
    self = [super init];
    
    
    return self;
}

+ (ParabolaLine *)sharedInstence
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       parabola = [[ParabolaLine alloc] init];
    });
    
    return parabola;
}

/**
 *  将某个view或者layer从起点抛到终点
 *
 *  @param view     被抛的物体
 *  @param start    起点坐标
 *  @param end      终点坐标
 *  @param endScale 终点view大小
 */
- (void)throwView:(UIView *)view from:(CGPoint)start to:(CGPoint)end endScale:(CGFloat )endScale
{
    UIBezierPath *path= [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(start.x, start.y)];
    [path addQuadCurveToPoint:CGPointMake(end.x+25,  end.y+25) controlPoint:CGPointMake(start.x - 180, start.y - 200)];
    
    [self throwView:view path:path rotaion:YES endScale:endScale];
}


/**
 *  将某个view或者layer从起点抛到终点
 *
 *
 *  @param view         被抛的物体(图片)
 *  @param path         贝赛尔曲线
 *  @param endScale     终点view大小
 *  @param isRotation   是否旋转
 */
- (void)throwView:(UIView *)view path:(UIBezierPath *)path rotaion:(BOOL)isRotation endScale:(CGFloat)endScale
{
    if (view) {
        self.throwWiew = view;
    } else {
        // 可以自己添加一个小圆点
    }
    
    [self groupAnimation:path rotation:isRotation endScale:endScale];
}

- (void)groupAnimation:(UIBezierPath *)path rotation:(BOOL)isRotation endScale:(CGFloat)endScale
{
    [self groupAnimation:path rotation:YES endScale:endScale animationDuration:0.9f];
}

#pragma mark - 组合动画

- (void)groupAnimation:(UIBezierPath *)path rotation:(BOOL)isRotation endScale:(CGFloat)endScale animationDuration:(CFTimeInterval)animationDuration
{
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        keyFrameAnimation.path = path.CGPath;
        keyFrameAnimation.rotationMode = kCAAnimationRotateAuto;


    
        CABasicAnimation *scaleBaseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleBaseAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
        scaleBaseAnimation.toValue = [NSNumber numberWithFloat:endScale];
        scaleBaseAnimation.duration = animationDuration;
        scaleBaseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    
        CABasicAnimation *rotationBaseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationBaseAnimation.duration = animationDuration;
        rotationBaseAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0f];
        rotationBaseAnimation.duration = 0.3f;
        rotationBaseAnimation.cumulative = YES;
        rotationBaseAnimation.repeatCount = animationDuration / 0.3f;
        

        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        if (isRotation) {
            [animationGroup setAnimations:@[keyFrameAnimation, rotationBaseAnimation, scaleBaseAnimation]];
        } else {
            [animationGroup setAnimations:@[keyFrameAnimation, scaleBaseAnimation]];
        }
    
        animationGroup.duration = animationDuration;
        animationGroup.removedOnCompletion = NO;
        animationGroup.fillMode = kCAFillModeForwards;
        animationGroup.delegate = self;
        [self.throwWiew.layer addAnimation:animationGroup forKey:@"group"];

    
    
}

#pragma mark - animationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (self.animationCompletion) {
        self.animationCompletion();
    }
    
    self.throwWiew = nil;
}


@end
