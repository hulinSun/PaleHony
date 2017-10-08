//
//  NSObject+KVO.h
//  Test
//
//  Created by Hony on 2017/10/7.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 手动实现KVO
 */
@interface NSObject (KVO)

- (void)jn_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
