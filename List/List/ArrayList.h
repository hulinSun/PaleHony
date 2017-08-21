//
//  ArrayList.h
//  List
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 shl. All rights reserved.
//

#ifndef ArrayList_h
#define ArrayList_h

#include <stdio.h>

// 每次扩容的数量
const static int ExpandCapacity = 10;

// 数据找不到的返回值
const static int ListNotFound = -1;

// 节点里面的数据
typedef void * ArrayListNodeValue;

typedef struct {
    int capacity; // 容量
    int length; // 长度(当前节点的数量)
    ArrayListNodeValue *values;
} ArrayList; // 线性表

void List_Print(ArrayList * list);

// 创建
ArrayList *List_Create(int capacity);

// 清空
void List_Clear(ArrayList *list);

// 销毁
void List_Destroy(ArrayList *list);

// 获取长度
int List_Length(ArrayList *list);

// 获得index位置对应的数据
ArrayListNodeValue List_Get(ArrayList *list, int index);

// 获得某个数据对应的index位置
int List_Index(ArrayList *list, ArrayListNodeValue value);

// 往index位置插入数据
void List_Insert(ArrayList *list, int index, ArrayListNodeValue value);

// 往最后面位置添加数据
void List_Add(ArrayList *list, ArrayListNodeValue value);

// 设置index位置的数据
void List_Set(ArrayList *list, int index, ArrayListNodeValue value);

// 删除index位置的数据
ArrayListNodeValue List_Remove(ArrayList *list, int index);

// 删除某种数据
void List_Remove_Value(ArrayList *list, ArrayListNodeValue value);


#endif /* ArrayList_h */
