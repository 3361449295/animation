//
//  ViewController.m
//  exampleForAnimation
//
//  Created by pengpeng on 2017/2/7.
//  Copyright © 2017年 pengpeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController {
    NSArray *titleArr;
    NSArray *sectionTitleArry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    titleArr = @[
                 @[
                     @{@"claName":@"PPBasicAnimationController",@"title":@"CABaseAnimation动画"},
                     @{@"claName":@"PPKeyframeAnimationController",@"title":@"CAKeyframeAnimation动画"},
                     @{@"claName":@"PPTransitionViewController",@"title":@"CATransitionAnimation动画"},
                     @{@"claName":@"PPSpringAnimController",@"title":@"CATransitionAnimation动画"},
                     ],
                 
                 @[
                     @{
                         @"claName":@"PPDrawLineController",
                         @"title":@"画线动画"
                         },
                     @{
                         @"claName":@"PPWaterWaveController",
                         @"title":@"水波纹效果"
                         },
                     @{
                         @"claName":@"PPFireAnimController",
                         @"title":@"粒子动画-火苗效果"
                         },
                     ]
                 ];
    
    sectionTitleArry = @[@"常见动画实例",@"动画常见经典实例"];
   
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *tempArr = titleArr[section];
    return tempArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *tempArr = titleArr[indexPath.section];
    NSDictionary *tempDic = tempArr[indexPath.row];
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = tempDic[@"title"];
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *tempArr = titleArr[indexPath.section];
    NSDictionary *tempDic = tempArr[indexPath.row];
    NSString *vcName = tempDic[@"claName"];
    
    UIViewController *tempVC = (UIViewController *)[[NSClassFromString(vcName) alloc] init];
    if (tempVC == nil) {
        return;
    }else {
        tempVC.title = tempDic[@"title"];
        [self.navigationController pushViewController:tempVC animated:YES];
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    return sectionTitleArry[section];
}







@end
