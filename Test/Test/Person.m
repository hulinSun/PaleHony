//
//  Person.m
//  Test
//
//  Created by Hony on 2017/10/7.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)setName:(NSString *)name{
    _name = name;
    NSLog(@"父类被调用了");
}
@end
