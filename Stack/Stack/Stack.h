//
//  Stack.h
//  Stack
//
//  Created by mac on 17/8/22.
//  Copyright © 2017年 shl. All rights reserved.
//

#ifndef Stack_h
#define Stack_h

#include <stdio.h>

typedef void * StackValue;
typedef void Stack;


void Stack_Print(Stack *stack);

// 创建
Stack *Stack_Create(int capaticy);

// 销毁
void Stack_Destroy(Stack *stack);

// 清空
void Stack_Clear(Stack *stack);

// push
void Stack_Push(Stack *stack, StackValue value);

// pop
StackValue Stack_Pop(Stack *stack);

// top
StackValue Stack_Top(Stack *stack);

// lenth
int Stack_Length(Stack *stack);

#endif /* Stack_h */
