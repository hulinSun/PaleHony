//
//  NSObject+KVO.m
//  Test
//
//  Created by Hony on 2017/10/7.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (KVO)

- (void)jn_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [NSString stringWithFormat:@"JNKVO_%@",oldClassName];
    const char *newName = [newClassName UTF8String];
    
    // 创建类
    Class newClass = objc_allocateClassPair([self class], newName, 0);
    
    // 改变isa
    object_setClass(self, newClass);
    
    // 注册
    objc_registerClassPair(newClass);
    
    // 添加setName：方法
    class_addMethod(newClass, @selector(setName:), (IMP)setName, "");
}

void setName(id self,SEL _cmd, NSString *name){
    
    NSLog(@"来到了这个方法 name = %@",name);
    // 调用父类的方法
    Class cls = [self  class];
    Class superCls = class_getSuperclass(cls);
    object_setClass(self, superCls);
    objc_msgSend(self,@selector(setName:) , name);
    object_setClass(self, cls);
    
    // 发出通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CHANGE" object:nil userInfo:@{@"newname":name , @"oldName":[self valueForKeyPath:@"name"]}];
}

@end
