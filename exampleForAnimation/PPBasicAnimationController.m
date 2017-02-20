//
//  PPBasicAnimationController.m
//  exampleForAnimation
//
//  Created by pengpeng on 2017/2/7.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "PPBasicAnimationController.h"

@interface PPBasicAnimationController ()

@end

@implementation PPBasicAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    



     /**------------------------旋转动画-------------------------------------*/
    UIView *rorationViewX = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 70, 70)];
    rorationViewX.backgroundColor = [UIColor redColor];
    [self.view addSubview:rorationViewX];
    
    CABasicAnimation *basicAniX = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basicAniX.duration = 1.5; //动画持续时间
    basicAniX.repeatCount = HUGE_VALF;  //一直不断重复
    basicAniX.toValue = @(M_PI*2);  //所改变属性结束时的值
    basicAniX.beginTime = 0.0; //指定动画开始时间
    //旋转是绕锚点进行旋转，锚点默认是和中心点一致
//    rorationViewX.layer.anchorPoint = CGPointMake(1, 1);
    [rorationViewX.layer addAnimation:basicAniX forKey:nil];

    
     /**------------------------移动动画-------------------------------------*/
    UIView *moveView = [[UIView alloc] initWithFrame:CGRectMake(20, 240, 70, 70)];
    moveView.backgroundColor = [UIColor redColor];
    [self.view addSubview:moveView];
    
    CABasicAnimation *basicAniM = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAniM.fromValue = [NSValue valueWithCGPoint:CGPointMake(20, 240)];
    basicAniM.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 240)];
    basicAniM.duration = 2;
    basicAniM.repeatCount = HUGE_VALF;
    
    //removedOnCompletion : 动画完成后是否从CALayer上移除动画
    basicAniM.removedOnCompletion = YES;
    //fillMode = kCAFillModeForwards;   //动画结束后，保持最后的状态
    basicAniM.fillMode = kCAFillModeForwards;
    basicAniM.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [moveView.layer addAnimation:basicAniM forKey:nil];
    
    
     /**------------------------背景颜色变化动画-------------------------------------*/
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 310, 70, 70)];
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    
    CABasicAnimation *basicAniBG = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    basicAniBG.fromValue = [UIColor redColor];
    basicAniBG.toValue = [UIColor yellowColor];
    basicAniBG.duration = 1;
    basicAniBG.autoreverses = true;
    basicAniBG.repeatCount = HUGE_VALF;
    [bgView.layer addAnimation:basicAniBG forKey:nil];
    
    
    
}


@end
