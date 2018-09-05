//
//  PPKeyframeAnimationController.m
//  exampleForAnimation
//
//  Created by pengpeng on 2017/2/7.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "PPKeyframeAnimationController.h"

@interface PPKeyframeAnimationController ()

@property (nonatomic, strong) UIImageView *addCarImg;

@end

@implementation PPKeyframeAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //----------------------------1.CAKeyframeAnimation动画1-----------------------------
    UIView *moveView = [[UIView alloc] initWithFrame:CGRectMake(30, 30, 10, 10)];
    moveView.layer.cornerRadius = 5;
    moveView.backgroundColor = [UIColor redColor];
    [self.view addSubview:moveView];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(30, 30)],
                         [NSValue valueWithCGPoint:CGPointMake(30, 60)],
                         [NSValue valueWithCGPoint:CGPointMake(60, 60)],
                         [NSValue valueWithCGPoint:CGPointMake(60, 30)],
                         [NSValue valueWithCGPoint:CGPointMake(90, 30)],
                         [NSValue valueWithCGPoint:CGPointMake(90, 60)],
                         [NSValue valueWithCGPoint:CGPointMake(120, 60)],
                         [NSValue valueWithCGPoint:CGPointMake(120, 30)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 30)]];
    //对每一帧动画进行设置
//    animation.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5]];
//    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    animation.repeatCount = HUGE_VALF;
    animation.duration = 4;
    animation.autoreverses = YES;
    [moveView.layer addAnimation:animation forKey:nil];
    
    //----------------------------2.CAKeyframeAnimation动画2-----------------------------
    UIView *moveView1 = [[UIView alloc] initWithFrame:CGRectMake(30, 80, 10, 10)];
    moveView1.layer.cornerRadius = 5;
    moveView1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:moveView1];
    
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation1.repeatCount = HUGE_VALF;
    animation1.duration = 1;
    animation1.autoreverses = YES;
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
//    //设置开始移动位置
    CGPathMoveToPoint(path, NULL, 0, 100);
//    CGPathAddLineToPoint(path, NULL, 300, 100);
//    CGPathAddLineToPoint(path, NULL, 300, 300);
//    CGPathAddLineToPoint(path, NULL, 0, 300);
//    CGPathAddLineToPoint(path, NULL, 0, 100);
//    animation1.keyTimes = @[@(0.0),@(0.3),@(0.5),@(0.7),@(1)];
    CGPathAddQuadCurveToPoint(path, NULL, 100, 100, self.view.bounds.size.width, 600);
    animation1.path = path;
    
    CGPathRelease(path);
    [moveView1.layer addAnimation:animation1 forKey:nil];
    

    //----------------------------2.CAKeyframeAnimation动画购物车-----------------------------
    self.addCarImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height+10, 30, 30)];
    self.addCarImg.hidden = YES;
    [self.view addSubview:self.addCarImg];
    self.addCarImg.image = [UIImage imageNamed:@"face sad"];
    
    
    

    /*
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
    */
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.addCarImg.hidden = NO;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    //    设置开始位置
    CGPathMoveToPoint(path, NULL, self.addCarImg.layer.position.x-40, self.addCarImg.layer.position.y-40);//移动到起始点
    //    沿着路径添加四曲线点移动
    CGPathAddQuadCurveToPoint(path, NULL, 100, 100, self.view.frame.size.width, 0);
    animation.path = path;
    
    CGPathRelease(path);
    animation.duration = 0.7;
    [self.addCarImg.layer addAnimation:animation forKey:@"KCKeyframeAnimation_Position"];
    
    //    旋转动画
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 0.1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 50;
    
    //    为addCartImg添加旋转动画
    [self.addCarImg.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}



@end
