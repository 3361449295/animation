//
//  JXJingDongCarViewController.m
//  exampleForAnimation
//
//  Created by Jhin on 2018/9/5.
//  Copyright © 2018年 pengpeng. All rights reserved.
//

#import "JXJingDongCarViewController.h"

@interface JXJingDongCarViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation JXJingDongCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.view addSubview:self.imgV];
}

- (IBAction)shoppingCartAction:(id)sender {
    
    _imgV.hidden = NO;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @(3.2);
    scaleAnimation.toValue = @(1);
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @(0.2);
    opacityAnimation.toValue = @(1);

    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.duration = 0.1;
    group.repeatCount = 1;
    group.animations = @[scaleAnimation,opacityAnimation];
    [group setValue:@"group1" forKey:@"AnimationKey"];
    [_imgV.layer addAnimation:group forKey:@"scale"];
    
    
    
    


    
}



- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
    if (flag) {
        CABasicAnimation * animation = (CABasicAnimation *)theAnimation;
        if ([[animation valueForKey:@"AnimationKey"] isEqualToString:@"group1"]) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
                CGMutablePathRef path = CGPathCreateMutable();
                CGPathMoveToPoint(path, NULL, _imgV.center.x, _imgV.center.y);
                CGPathAddQuadCurveToPoint(path, NULL, 0, 0, self.view.bounds.size.width / 2, self.view.bounds.size.height);
                frameAnimation.path = path;
                CGPathRelease(path);
                
                CABasicAnimation *opacityOtherAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
                opacityOtherAnimation.fromValue = @(1);
                opacityOtherAnimation.toValue = @(0.4);
                
                
                CABasicAnimation *scaleOtherAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
                scaleOtherAnimation.fromValue = @(1);
                scaleOtherAnimation.toValue = @(0.2);
                
                CAAnimationGroup *groupOther = [CAAnimationGroup animation];
                groupOther.duration = 1;
                groupOther.animations = @[frameAnimation,opacityOtherAnimation,scaleOtherAnimation];
                
                
                [_imgV.layer addAnimation:groupOther forKey:nil];
            });
            
            
        }
    }

    
}

- (UIImageView *)imgV {
    if (!_imgV) {
        _imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiezi"]];
        _imgV.frame = CGRectMake(0, 0, 80, 80);
        _imgV.center = self.imageV.center;
        _imgV.hidden = YES;
        _imgV.layer.cornerRadius = 40;
        _imgV.layer.masksToBounds = YES;
        
        _imgV.layer.borderColor = [UIColor whiteColor].CGColor;
        
    }
    return _imgV;
}


@end
