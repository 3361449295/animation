//
//  PPKeyframeAnimationController.m
//  exampleForAnimation
//
//  Created by pengpeng on 2017/2/7.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "PPKeyframeAnimationController.h"

@interface PPKeyframeAnimationController ()

@end

@implementation PPKeyframeAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建贝塞尔曲线
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 250, 500)];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];
    
    
    UIView *frameAnim = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 70, 80)];
    frameAnim.backgroundColor = [UIColor redColor];
    [self.view addSubview:frameAnim];
    
    
    CAKeyframeAnimation *orbitAinm = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    orbitAinm.duration = 5;
    orbitAinm.path = bezierPath.CGPath;  //指定动画轨迹为贝塞尔曲线
    orbitAinm.calculationMode = kCAAnimationPaced; //节奏动画自动计算动画的运动时间,使得动画均匀进行
    orbitAinm.rotationMode = kCAAnimationRotateAutoReverse;
    orbitAinm.repeatCount = HUGE_VALF;
    [frameAnim.layer addAnimation:orbitAinm forKey:nil];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 0.5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
}



@end
