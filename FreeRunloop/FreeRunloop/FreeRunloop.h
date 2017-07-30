//
//  FreeRunloop.h
//  FreeRunloop
//
//  Created by Hony on 2017/7/30.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 这个类内部维护一些操作(耗时操作),在runloop空闲时间。会执行这些操作。达到一些优化的目的
 */
@interface FreeRunloop : NSObject

-(instancetype)initWithTarget:(id)target selector:(SEL)selector;
+(instancetype)freeRunloopWithTarget:(id)target selector:(SEL)selector;

-(void)beginFreeJob;
@end
