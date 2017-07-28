//
//  ViewController.m
//  RealmDemo
//
//  Created by Hony on 2017/7/28.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Dog.h"
#import <Realm/Realm.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", NSHomeDirectory());
}



/**
 添加
 */
- (IBAction)add:(id)sender {
    
    Person *person = [[Person alloc]initWithValue:@[@"Hony",@22]];
    RLMRealm *rlm = [RLMRealm defaultRealm];
    
    // realm 的数据操作要在事务中
    [rlm transactionWithBlock:^{
        [rlm addObject:person];
    }];
    
    [rlm beginWriteTransaction];
    [rlm addObject:person];
    [rlm commitWriteTransaction];
}

/**
 删除
 */
- (IBAction)delete:(id)sender {
    
    RLMResults<Person *> *persons = [Person objectsWhere:@"name = '江南'"];
    if (persons.count > 0) {
        Person *jnperson = persons.firstObject;
        RLMRealm *rlm = [RLMRealm defaultRealm];
        // realm 的数据操作要在事务中
        [rlm transactionWithBlock:^{
            [rlm deleteObject:jnperson];
        }];
    }
}

/**
 修改
 */
- (IBAction)update:(id)sender {
    
    Person *firstP = [Person allObjects].firstObject;
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        firstP.name = @"江南";
    }];
}

/**
 查询
 */
- (IBAction)query:(id)sender {
    // 注意，这一行中，所有的person对象还没有载入内存了。只有用到的视乎才会加载到内存中
    RLMResults<Person *> *persons =  [Person allObjects];
    for (Person *p in persons) {
        NSLog(@"name = %@",p.name);
    }
}


/**
 一对一
 */
- (IBAction)p2p:(id)sender {
    Person *p = [[Person alloc]init];
    p.name = @"唐伯虎";
    p.age = 18;
    
    Dog *wangcai = [[Dog alloc]init];
    wangcai.name = @"旺财";
    wangcai.isFemail = NO;
    
    p.dog = wangcai;
    
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm addObject:p];
    }];
}



/**
 一对多
 */
- (IBAction)one2More:(id)sender {
    
    Person *p = [[Person alloc]init];
    p.name = @"唐伯虎";
    p.age = 18;
    
    Dog *wangcai = [[Dog alloc]init];
    wangcai.name = @"旺财";
    wangcai.isFemail = NO;
    
    Dog *xiaoqiang = [[Dog alloc]init];
    xiaoqiang.name = @"小强";
    xiaoqiang.isFemail = YES;
    
    p.dog = wangcai;
    [p.dogs addObject:wangcai];
    [p.dogs addObject:xiaoqiang];
    
    
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm addObject:p];
    }];
}

/**
 反向
 */
- (IBAction)back:(id)sender {
    
    Person *p = [[Person alloc]init];
    p.name = @"唐伯虎";
    p.age = 18;
    
    Dog *wangcai = [[Dog alloc]init];
    wangcai.name = @"旺财";
    wangcai.isFemail = NO;
    
    Dog *xiaoqiang = [[Dog alloc]init];
    xiaoqiang.name = @"小强";
    xiaoqiang.isFemail = YES;
    
    p.dog = wangcai;
    [p.dogs addObject:wangcai];
    [p.dogs addObject:xiaoqiang];
    
    
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm addObject:p];
    }];
    
    RLMResults *results = [Dog objectsWhere:@"name = '冠希'"];
    if (results.count) {
        Dog *firstDog = results.firstObject;
        // 只要有这个依赖冠希，就能获得这只狗的owners
        NSLog(@"------%@-----",firstDog.owners);
    }
}





@end
