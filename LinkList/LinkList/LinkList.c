//
//  LinkList.c
//  LinkList
//
//  Created by Hony on 2017/8/22.
//  Copyright © 2017年 Hony. All rights reserved.
//

/// 链表实现线性表

#include "LinkList.h"
#include <stdlib.h>

// 创建
LinkList *List_Create(){
    
    LinkList *list = malloc(sizeof(LinkList) + sizeof(LinkListNode));
    if (list) {
        list->length = 0;
        list->header = (LinkListNode *)(list + 1);
    }
    return  list;
}

// 清空
void List_Clear(LinkList *list){
    
    if (list == NULL) return;
    
    // 删除所有的节点
    LinkListNode *currentNode = list->header;
    while (currentNode) {
        LinkListNode *nextNode = currentNode->next;
        if (nextNode == NULL) break;
        
        currentNode->next = nextNode->next;
        free(nextNode);
        nextNode = NULL;
    }
    
    list->header->next = NULL;
    list->length = 0;
}

// 销毁
void List_Destroy(LinkList *list){
    
    if (list == NULL) {
        return;
    }
    List_Clear(list);
    
    free(list);
    list = NULL;
}

// 获取长度
int List_Length(LinkList *list){
    if (list == NULL) {
        return 0;
    }
    return list->length;
}

// 获得index位置对应的数据
LinkListNodeValue List_Get(LinkList *list, int index){
    
    if (list == NULL || index >= list->length || index < 0) {
        return NULL;
    }
    
    // 遍历
    LinkListNode *current = list->header;
    for (int i = 0 ; i <= index; i++) {
        current = current->next;
    }
    return  current->value;
}

// 获得某个数据对应的index位置
int List_Index(LinkList *list, LinkListNodeValue value){
    
    if (list == NULL) {
        return LinkListNotFound;
    }
    LinkListNode *currentNode = list->header;
    for (int i = 0; i < list->length; i++) {
        
        currentNode = currentNode->next;
        if (currentNode->value == value) {
            return i;
        }
    }
    return LinkListNotFound;
}

// 往index位置插入数据
void List_Insert(LinkList *list, int index, LinkListNodeValue value){
    
    if (list == NULL || index > list->length || index < 0) {
        return;
    }
    
    // 创建一个新的node
    LinkListNode *newNode = malloc(sizeof(LinkListNode));
    newNode->value = value;
    if (newNode == NULL) {
        return;
    }
    
    // 插入
    LinkListNode *currentNode = list->header;
    for (int i = 0; i < index; i++) {
        currentNode = currentNode->next;
    }
    
    // 获取到了当前的节点下一个节点
    LinkListNode *currentNextNode = currentNode->next;
    
    currentNode->next = newNode;
    newNode->next = currentNextNode;
    
    list->length ++;
}

// 往最后面位置添加数据
void List_Add(LinkList *list, LinkListNodeValue value){
    
    if (list== NULL) {
        return;
    }
    // 添加
    List_Insert(list, list->length, value);
}

// 设置index位置的数据
void List_Set(LinkList *list, int index, LinkListNodeValue value){
    
    if (list == NULL || index >= list->length || index < 0) {
        return;
    }
    
    // 找到第index 个节点
    LinkListNode *current = list->header;
    for (int i = 0; i <= index; i++) {
        current = current->next;
    }
    
    current->value = value;
}

// 删除index位置的数据
LinkListNodeValue List_Remove(LinkList *list, int index){
    
    if (index > list->length || index < 0 || list == NULL) {
        return NULL;
    }
    
    LinkListNode *current = list->header;
    // 找到前一个节点
    for (int i = 0; i < index; i++) {
        current = current->next;
    }
    
    LinkListNode *removedNode = current->next;
    LinkListNodeValue value = removedNode->value;
    
    current->next = removedNode->next;
    
    free(removedNode);
    removedNode = NULL;
    
    list->length --;
    
    return value;
    
}

// 删除某种数据
void List_Remove_Value(LinkList *list, LinkListNodeValue value){
    
    if (list == NULL) {
        return;
    }
    
    LinkListNode *currentNode = list->header;
    
    while (currentNode) {
        LinkListNode *nextNode = currentNode->next;
        if (nextNode == NULL) {
            return;
        }
        
        if (nextNode->value == value) {
            currentNode->next = nextNode->next;
            free(nextNode);
            nextNode = NULL;
            list->length--;
        }else{
            currentNode = nextNode;
        }
    }
}





