//
//  ArrayList.c
//  List
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 shl. All rights reserved.
//

#include "ArrayList.h"
#include <stdlib.h>
#include <string.h>


void List_Print(ArrayList * list){
    if (list == NULL) {
        return;
    }
    
    for (int i = 0 ; i < list->length; i++) {
        if (i == list->length - 1) {
            printf(" %d \n" , (int)list->values[i]);
        }else{
            printf(" %d -" , (int)list->values[i]);
        }
    }
}

// 创建
ArrayList *List_Create(int capacity){
    if (capacity < 0) {
        return  NULL;
    }
    ArrayList *list = malloc(sizeof(ArrayList));
    list->capacity = capacity;
    list->length = 0;
    list->values = capacity ? malloc(sizeof(ArrayListNodeValue) * capacity) : NULL ;
    return list;
}

// 清空
void List_Clear(ArrayList *list){
    if (list == NULL) {
        return;
    }
    // 不让访问
    list->length = 0;
}

// 销毁
void List_Destroy(ArrayList *list){
    if (list == NULL) {
        return;
    }
    
    free(list->values);
    list->values = NULL;
    
    free(list);
    list = NULL;
}

// 获取长度
int List_Length(ArrayList *list){
    if (list == NULL) {
        return 0;
    }
    return list->length;
}

// 获得index位置对应的数据
ArrayListNodeValue List_Get(ArrayList *list, int index){
    if (list == NULL || index >= list->length || index < 0) {
        return NULL;
    }
    return list->values[index];
}

// 获得某个数据对应的index位置
int List_Index(ArrayList *list, ArrayListNodeValue value){
    
    if (list == NULL ) {
        return ListNotFound;
    }
    
    for (int i = 0; i < list->length; i++) {
        if (list->values[i] == value) {
            return i;
        }
    }
    return ListNotFound;
}

// 往index位置插入数据
void List_Insert(ArrayList *list, int index, ArrayListNodeValue value){
    
    if (list == NULL || index < 0 ) {
        return;
    }
    
    // 考虑数组扩容的情况
    if (list->length == list->capacity) {
        // 扩容
        int newCapity = list->capacity + ExpandCapacity;
        
        // 申请新内存
        ArrayListNodeValue *newNode = malloc(sizeof(ArrayListNodeValue) * newCapity);
        
        if (newNode == NULL) {
            return;
        }
        // 拷贝
        memcpy(newNode, list->values, sizeof(ArrayListNodeValue) * list->capacity);
        
        // 释放原内存
        free(list->values);
        list->values = newNode;
        
        list->capacity = newCapity;
    }
    
    // 往后靠
    for (int i = list-> length - 1; i>= index; i--) {
        list->values[i+1] = list->values[i];
    }
    list->values[index] = value;
    list->length ++;
}

// 往最后面位置添加数据
void List_Add(ArrayList *list, ArrayListNodeValue value){
    
    if (list == NULL) {
        return;
    }
    List_Insert(list, list->length, value);
}

// 设置index位置的数据
void List_Set(ArrayList *list, int index, ArrayListNodeValue value){
    
    if (index >= list->capacity ||index < 0 || list == NULL) {
        return;
    }
    list->values[index] = value;
    
}

// 删除index位置的数据
ArrayListNodeValue List_Remove(ArrayList *list, int index){
    
    if (list == NULL || index < 0 || index > list->capacity) {
        return  NULL;
    }
    
    ArrayListNodeValue removedValue = list->values[index];
    
    // 删除
    // 后面的往前靠
    for (int i = index + 1; i < list->length; i++) {
        list->values[i - 1] = list->values[i];
    }
    
    list->length --;
    
    return removedValue;
}

// 删除某种数据
void List_Remove_Value(ArrayList *list, ArrayListNodeValue value){
    
    if (list == NULL) {
        return ;
    }
    
    int removeCount = 0;
    
    for (int i = 0; i < list->length; i++) {
        if (list->values[i] == value) {
            removeCount++;
        }else{
            // 变位置
            list->values[i - removeCount] = list->values[i];
        }
    }
    
    list->length -= removeCount;
}

