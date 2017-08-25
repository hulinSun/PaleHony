//
//  Queue.c
//  LinkQueue
//
//  Created by Hony on 2017/8/25.
//  Copyright © 2017年 Hony. All rights reserved.
//

#include "Queue.h"
#include "stdlib.h"


void Queue_Print(Queue *queue){
    if (queue == NULL) {
        return;
    }
    
    QueueNode *current = queue->header;
    for (int i = 0; i< queue->length; i++) {
        current= current->next;
        if (i == queue->length - 1) {
            printf("%d\n",(int)current->value);
        }else{
            printf("%d -> ",(int)current->value);
        }
    }
}

// 创建
Queue* Queue_Creat(){
    Queue *queue = malloc(sizeof(Queue) + sizeof(QueueNode));
    if (queue) {
        queue->length = 0;
        queue->header = (QueueNode *)(queue + 1);
    }
    return queue;
}

// 销毁
void Queue_Destroy(Queue * queue){
    if (queue == NULL) {
        return;
    }
    
    free(queue->header);
    queue->header = NULL;
    free(queue);
    queue = NULL;
}

// 清空
void Queue_Clear(Queue* queue){
    if (queue == NULL) {
        return;
    }
    queue->length = 0;
}

// 入队 队尾添加数据
void Queue_Enqueue(Queue* queue, QueueNodeValue value){
    
    if (queue == NULL) {
        return;
    }
    
    QueueNode *newNode = malloc(sizeof(QueueNode));
    if (newNode == NULL) {
        return;
    }
    
    newNode->value = value;
    newNode->next = NULL;
    // 遍历
    QueueNode *current = queue->header;
    for (int i = 0; i < queue->length; i++) {
        current = current->next;
    }
    
    // 添加
    current->next = newNode;
    queue->length ++;
    
}

// 出队 (删除队头的数据并返回)
QueueNodeValue Queue_Dequeue(Queue* queue){
    
    if (queue == NULL) {
        return NULL;
    }
    
    QueueNode *headerNext = queue->header->next;
    QueueNode *next = headerNext->next;
    QueueNodeValue value = headerNext->value;
    
    queue->header->next = next;
    queue->length--;
    return value;
}

// 队列的长度
int Queue_Length(Queue* queue){
    if (queue == NULL) {
        return 0;
    }
    return queue->length;
}


// 队列是否为空
int Queue_Isempty(Queue *queue){
    
    if (queue == NULL || queue->length == 0) {
        return 1;
    }
    return 0;
}
