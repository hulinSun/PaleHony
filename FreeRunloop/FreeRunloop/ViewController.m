//
//  ViewController.m
//  FreeRunloop
//
//  Created by Hony on 2017/7/30.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import "ViewController.h"
#import "FreeRunloop.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // runloop 在空闲时期做一些优化
    FreeRunloop *runloop = [FreeRunloop freeRunloopWithTarget:self selector:@selector(test)];
    [runloop beginFreeJob];
}


-(void)test{
    for (int i = 0; i < 10 ; i++) {
        NSLog(@"%d",i);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
