//
//  Stack.c
//  Stack
//
//  Created by mac on 17/8/22.
//  Copyright © 2017年 shl. All rights reserved.
//

#include "Stack.h"
#include "ArrayList.h"


// 用arrayList 实现栈

void Stack_Print(Stack *stack){
    List_Print(stack);
}

// 创建
Stack *Stack_Create(int capaticy){
    
    return List_Create(capaticy);
}

// 销毁
void Stack_Destroy(Stack *stack){
    List_Destroy(stack);
}

// 清空
void Stack_Clear(Stack *stack){
    List_Clear(stack);
}

// push
void Stack_Push(Stack *stack, StackValue value){
    List_Add(stack, value);
}

// pop
StackValue Stack_Pop(Stack *stack){
    return List_Remove(stack, List_Length(stack) - 1);
}

// top
StackValue Stack_Top(Stack *stack){
    // 看第一个
    return  List_Get(stack, List_Length(stack) - 1);
}

// lenth
int Stack_Length(Stack *stack){
    return List_Length(stack);
}