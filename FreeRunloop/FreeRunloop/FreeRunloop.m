//
//  FreeRunloop.m
//  FreeRunloop
//
//  Created by Hony on 2017/7/30.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import "FreeRunloop.h"
#import <CoreFoundation/CoreFoundation.h>

@interface FreeRunloop()
{
    SEL _selector;
}

/** target 弱引用 */
@property (nonatomic,weak) id target;
@end

@implementation FreeRunloop

static NSMutableSet *_set;

+(void)initialize{
    
    if (_set == nil) {
        _set = [[NSMutableSet alloc]init];
    }
}

-(instancetype)initWithTarget:(id)target selector:(SEL)selector{

    
    if (self = [super init]) {
        self.target = target;
        _selector = selector;
    }
    return self;
}

+(instancetype)freeRunloopWithTarget:(id)target selector:(SEL)selector{
    return [[self alloc]initWithTarget:target selector:selector];
}

-(void)beginFreeJob{
    
    [self setup];
    [_set addObject:self];
}

-(void)dealloc{
    NSLog(@"FreeRunloop释放了");
}


#pragma mark - PrivateMethod
-(void)setup{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CFRunLoopObserverRef obser = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopBeforeTimers | kCFRunLoopExit, YES, 0xFFFFFF, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
            if (_set.count > 0) {
                NSLog(@"-----runloop 空闲期执行操作 ------");
                [_set enumerateObjectsUsingBlock:^(FreeRunloop * free, BOOL * _Nonnull stop) {
                    [free.target performSelector: free-> _selector withObject:nil afterDelay:0];
                    // for i 数组遍历的时候不能进行删除，但是用官方的遍历方法可以删除
                    [_set removeObject:free];
                }];
            }
        });
          CFRunLoopAddObserver(CFRunLoopGetCurrent(), obser, kCFRunLoopCommonModes);
    });
}
@end
