//
//  Dog.h
//  RealmDemo
//
//  Created by Hony on 2017/7/28.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import <Realm/Realm.h>

@interface Dog : RLMObject

@property NSString *name;
@property BOOL  isFemail;

// readonly 是不会存在数据库里的
@property (readonly) RLMLinkingObjects *owners;

@end

// RLMArray<Dog *><Dog>
RLM_ARRAY_TYPE(Dog)
