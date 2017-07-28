//
//  Person.h
//  RealmDemo
//
//  Created by Hony on 2017/7/28.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"

@interface Person : RLMObject

@property NSString *name;
@property NSInteger age;
@property Dog *dog;

@property RLMArray<Dog *><Dog> *dogs;

@end

RLM_ARRAY_TYPE(Person)
