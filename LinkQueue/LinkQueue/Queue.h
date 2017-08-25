//
//  Queue.h
//  LinkQueue
//
//  Created by Hony on 2017/8/25.
//  Copyright © 2017年 Hony. All rights reserved.
//

#ifndef Queue_h
#define Queue_h

#include <stdio.h>

typedef void * QueueNodeValue;
typedef struct _QueueNode QueueNode;

struct _QueueNode{
    QueueNodeValue value;
    QueueNode *next;
};

typedef struct {
    int length;
    QueueNode *header;
}Queue;


void Queue_Print(Queue *queue);

// 创建
Queue* Queue_Creat();

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

// 队列是否为空
int Queue_Isempty(Queue *queue);


#endif /* Queue_h */


