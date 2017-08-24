//
//  Queue.h
//  Queue
//
//  Created by mac on 17/8/23.
//  Copyright © 2017年 shl. All rights reserved.
//

#ifndef Queue_h
#define Queue_h

#include <stdio.h>


// 队尾插入数据
// 队头添加数据
// FIFO

typedef void * QueueNodeValue;

typedef struct {
    // 队头
    int front;
    // 队尾
    int rear;
    // 容量
    int capactiy;
    // 指针
    QueueNodeValue *base;
}Queue;

void Queue_Print(Queue *queue);

// 创建
Queue* Queue_Creat(int capacity);

// 销毁
void Queue_Destroy(Queue * queue);

// 清空
void Queue_Clear(Queue* queue);

// 入队
void Queue_Enqueue(Queue* queue, QueueNodeValue value);

// 出队 (删除队头的数据并返回)
QueueNodeValue Queue_Dequeue(Queue* queue);

// 队列的长度
int Queue_Length(Queue* queue);

// 队列的容量
int Queue_Capacity(Queue* queue);

// 队列是否为空
int Queue_Isempty(Queue *queue);


#endif /* Queue_h */
