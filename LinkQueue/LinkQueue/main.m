//
//  main.m
//  LinkQueue
//
//  Created by Hony on 2017/8/25.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Queue *queue = Queue_Creat();
        Queue_Enqueue(queue, (QueueNodeValue)1);
        Queue_Enqueue(queue, (QueueNodeValue)2);
        Queue_Enqueue(queue, (QueueNodeValue)3);
        Queue_Enqueue(queue, (QueueNodeValue)4);
        Queue_Enqueue(queue, (QueueNodeValue)5);
        Queue_Print(queue);
        
        
        Queue_Dequeue(queue);
        Queue_Print(queue);
        
        Queue_Enqueue(queue, (QueueNodeValue)7);
        Queue_Print(queue);
        
        Queue_Dequeue(queue);
        Queue_Print(queue);
        
    }
    return 0;
}
