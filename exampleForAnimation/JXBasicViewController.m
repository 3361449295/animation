//
//  JXBasicViewController.m
//  exampleForAnimation
//
//  Created by Jhin on 2018/9/5.
//  Copyright © 2018年 pengpeng. All rights reserved.
//

#import "JXBasicViewController.h"

@interface JXBasicViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;



@end

@implementation JXBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}


#pragma mark --平移
- (IBAction)translationAction:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.repeatCount = HUGE_VALF;
    animation.duration = 1;
    /**
     动画起始位置
     */
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    /**
     1.当KeyPath为positon未指定x或者y,则toValue指定的值即为动画中心点移动到的位置
     2.当KeyPath为postion.x,则横向移动,toValue指定的x值为动画x中心点移动到的位置,y值无效
     3.当KeyPath为postion.y,则横向移动,toValue指定的y值为动画y中心点移动到的位置,x只无效
     */
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    animation.autoreverses = YES;
    //防止动画回去
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
    //动画速度变化
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.imageV.layer addAnimation:animation forKey:@"position"];
    
}

#pragma mark --旋转动画
- (IBAction)rotationAction:(id)sender {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 2;
    animation.repeatCount = HUGE_VALF;
    animation.fromValue = @(0);
    animation.toValue = @(M_PI * 2);
    [self.imageV.layer addAnimation:animation forKey:@"retation"];
 
}
- (IBAction)scaleAction:(id)sender {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1;
    animation.repeatCount = HUGE_VALF;
    animation.fromValue = @(1.2);
    animation.toValue = @(0.8);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.imageV.layer addAnimation:animation forKey:@"transform"];
}

#pragma mark --keyframe直线动画
- (IBAction)keyframeStraightLineAction:(id)sender {
    
    CAKeyframeAnimation *animation  = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 4;
    animation.repeatCount = 1;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(50, 250)],[NSValue valueWithCGPoint:CGPointMake(300, 250)],[NSValue valueWithCGPoint:CGPointMake(50, 50)],[NSValue valueWithCGPoint:CGPointMake(150, 400)],[NSValue valueWithCGPoint:CGPointMake(100, 250)]];
    
    [self.imageView.layer addAnimation:animation forKey:nil];
    
}

#pragma mark --keyframe曲线动画

- (IBAction)keyframeCurveLineAction:(id)sender {

    CAKeyframeAnimation *animation  = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 4;
    animation.repeatCount = 1;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 800);
    CGPathAddQuadCurveToPoint(path, NULL, 100, 100, self.view.frame.size.width, 0);
    animation.path = path;
    CGPathRelease(path);
    
    [self.imageView.layer addAnimation:animation forKey:nil];
}




@end
