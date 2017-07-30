//
//  ViewController.m
//  UIScrollView底层实现
//
//  Created by Hony on 2017/7/30.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIView *scrollView;
@property (nonatomic, assign) CGPoint offsetX;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 参考链接 ： http://blog.jobbole.com/70143/
    
    UIView *scrollView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [scrollView addGestureRecognizer:pan];
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(100, 300, 100, 100);
    [scrollView addSubview:redView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.frame = CGRectMake(100, 100, 120, 60);
    [scrollView addSubview:blueView];
    
    
}

// 拖动的时候调用
- (void)pan:(UIPanGestureRecognizer *)pan
{
    // 获取偏移量
    CGPoint transP = [pan translationInView:pan.view];
    
//    _offsetX.x += -transP.x;
    _offsetX.y += -transP.y;
    _scrollView.bounds = CGRectMake(_offsetX.x, _offsetX.y, self.view.bounds.size.width, self.view.bounds.size.height);
    [pan setTranslation:CGPointZero inView:pan.view];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
