//
//  PPSpringAnimController.m
//  exampleForAnimation
//
//  Created by pengpeng on 2017/2/10.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "PPSpringAnimController.h"

@interface PPSpringAnimController ()

@end

@implementation PPSpringAnimController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 50, 30)];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    CASpringAnimation *springAnim = [CASpringAnimation animationWithKeyPath:@"position.x"];
    springAnim.mass = 1;  //质量
    springAnim.stiffness = 100;  //弹性指数
    springAnim.damping = 5; //阻力系数
    springAnim.initialVelocity = 100; //初始移动速度
    springAnim.fromValue = @10;
    springAnim.toValue = @160;
    springAnim.duration = springAnim.settlingDuration;
    springAnim.repeatCount = HUGE_VALF;
    [label.layer addAnimation:springAnim forKey:nil];
    
    
}



@end
