//
//  main.m
//  Queue
//
//  Created by mac on 17/8/23.
//  Copyright © 2017年 shl. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Queue.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Queue *q = Queue_Creat(10);
        Queue_Enqueue(q, (QueueNodeValue)1);
        Queue_Enqueue(q, (QueueNodeValue)2);
        Queue_Enqueue(q, (QueueNodeValue)3);
        Queue_Enqueue(q, (QueueNodeValue)4);
        Queue_Enqueue(q, (QueueNodeValue)5);
        
        Queue_Print(q);
        
        Queue_Dequeue(q);
        Queue_Print(q);
        
        Queue_Enqueue(q, (QueueNodeValue)7);
        Queue_Enqueue(q, (QueueNodeValue)8);
        Queue_Print(q);
        
        Queue_Dequeue(q);
        Queue_Print(q);
    }
    return 0;
}
