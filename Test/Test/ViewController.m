//
//  ViewController.m
//  Test
//
//  Created by Hony on 2017/9/29.
//  Copyright © 2017年 Hony. All rights reserved.
//


#import "ViewController.h"
#import "Person.h"
#import "NSObject+KVO.h"


@interface ViewController ()

@property (nonatomic,strong) Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _p = [[Person alloc]init];
    _p.name = @"哈哈";
    [_p jn_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change:) name:@"CHANGE" object:nil];
}

-(void)change:(NSNotification *)note{
    NSLog(@"info = %@",note.userInfo);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _p.name = @"嘻嘻";
}


-(void)test{
    
    NSString *s = @"ababababababxuhabasdf徐昊徐昊孙虎林iOS徐昊徐 哈oxuhao";
    NSMutableArray *arr = [NSMutableArray array];
    for (int j = 0; j < s.length; j++) {
        for (int i = j; i < s.length; i++) {
            NSRange range = NSMakeRange(j,s.length - i);
            NSString *c = [s substringWithRange:range];
            [arr addObject:c];
        }
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for(NSString *str in arr){
        if([dict valueForKey:str]){
            NSInteger num = [[dict valueForKey:str] integerValue];
            num++;
            [dict setValue:@(num) forKey:str];
        }else{
           [dict setValue:@1 forKey:str];
        }
    }
    
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setValue:@"" forKey:@"c"];
    [dict1 setValue:@"" forKey:@"aba"];
    [dict1 setValue:@"" forKey:@"徐昊"];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([dict1 valueForKey:key]) {
            NSLog(@"key:%@,showCount:%@",key,obj);
        }
    }];

}


@end
