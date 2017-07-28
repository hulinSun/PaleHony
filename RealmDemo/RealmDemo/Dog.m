//
//  Dog.m
//  RealmDemo
//
//  Created by Hony on 2017/7/28.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import "Dog.h"

@implementation Dog

// Specify default values for properties

// 默认值
//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}


// 忽略某个属性
//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}


+ (NSDictionary *)linkingObjectsProperties {
    return @{
             @"owners": [RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"Person") propertyName:@"dogs"],
             };
}

@end
