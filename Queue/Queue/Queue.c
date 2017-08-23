//
//  Queue.c
//  Queue
//
//  Created by mac on 17/8/23.
//  Copyright © 2017年 shl. All rights reserved.
//

#include "Queue.h"
#include <stdlib.h>

// 创建
Queue* Queue_Creat(int capacity){
    
    if (capacity < 0) {
        return  NULL;
    }
    
    Queue *queue = malloc(sizeof(Queue));
    
    if (queue == NULL) {
        return NULL;
    }
    queue->base = malloc(sizeof(QueueNodeValue) * capacity);
    queue->capactiy = capacity;
    queue->front = 0;
    queue->rear = 0;
    return  queue;
}

// 销毁
void Queue_Destroy(Queue * queue){
    
    if (queue == NULL) {
        return;
    }
    free(queue->base);
    queue->base = NULL;
    
    free(queue);
    queue = NULL;
}

// 清空
void Queue_Clear(Queue* queue){
    
    if (queue == NULL) {
        return;
    }
    queue->front = 0;
    queue->rear = 0;
    
}

// 入队
void Queue_Enqueue(Queue* queue, QueueNodeValue value){
    
    if (queue == NULL) {
        return ;
    }
    
    
    // 判断是否满了
    // 满了
    if ((queue->rear + 1) % queue->capactiy == queue->front ) {
        return;
    }else{
        /* 插入元素e为Q的新的队尾元素 */
        queue->base[queue->rear] = value;
        queue->rear = (queue->rear + 1) % queue->capactiy;
    }
    
}

// 出队
QueueNodeValue Queue_Dequeue(Queue* queue){
    
    if (Queue_Isempty(queue) == 1) {
        return NULL;
    }
    QueueNodeValue *value = queue->base[queue->front];
    queue->front = (queue->front + 1) % queue->capactiy;
    // 队头删除数据
    return  value;
}

// 队头
void * Queue_Header(Queue* queue){
    return  NULL;
}

// 队列的长度
int Queue_Length(Queue* queue){
    if (queue == NULL) {
        return  0;
    }
    
    // QueueNode 的个数即为长度. 小算法
    // (rear - front + maxSize) % maxSize
    return (queue->rear - queue->front + queue->capactiy) % queue->capactiy;
}

// 队列的容量
int Queue_Capacity(Queue* queue){
    
    if (queue == NULL) {
        return 0;
    }
    return queue->capactiy;
}


// 队列是否为空
int Queue_Isempty(Queue *queue){
    
    if (queue == NULL) {
        return 1;
    }
    
    if (queue->rear == queue->front) {
        return 1;
    }
    return 0;
}


