//
//  LinkList.h
//  LinkList
//
//  Created by Hony on 2017/8/22.
//  Copyright © 2017年 Hony. All rights reserved.
//

#ifndef LinkList_h
#define LinkList_h

#include <stdio.h>

// 节点里面的数据
typedef void * LinkListNodeValue;

// 数据找不到的返回值
const static int LinkListNotFound;

typedef struct _LinkListNode LinkListNode;

struct _LinkListNode {
    // 数据
    LinkListNodeValue value;
    // 下一个节点
    LinkListNode *next;
};

/**
 链表
 */
typedef struct {
    // 长度(当前节点的数量)
    int length;
     // 头结点(header->next用来指向首元素)
    LinkListNode *header;
} LinkList;

// 打印
void List_Print(LinkList *link);

// 创建
LinkList *List_Create();

// 清空
void List_Clear(LinkList *list);

// 销毁
void List_Destroy(LinkList *list);

// 获取长度
int List_Length(LinkList *list);

// 获得index位置对应的数据
LinkListNodeValue List_Get(LinkList *list, int index);

// 获得某个数据对应的index位置
int List_Index(LinkList *list, LinkListNodeValue value);

// 往index位置插入数据
void List_Insert(LinkList *list, int index, LinkListNodeValue value);

// 往最后面位置添加数据
void List_Add(LinkList *list, LinkListNodeValue value);

// 设置index位置的数据
void List_Set(LinkList *list, int index, LinkListNodeValue value);

// 删除index位置的数据
LinkListNodeValue List_Remove(LinkList *list, int index);

// 删除某种数据
void List_Remove_Value(LinkList *list, LinkListNodeValue value);

// 链表反转
void List_Inverse(LinkList *list);

#endif /* LinkList_h */
