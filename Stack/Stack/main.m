//
//  main.m
//  Stack
//
//  Created by mac on 17/8/22.
//  Copyright © 2017年 shl. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Stack.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Stack *stack = Stack_Create(10);
        Stack_Push(stack, (StackValue)1);
        Stack_Push(stack, (StackValue)2);
        Stack_Push(stack, (StackValue)3);
        Stack_Push(stack, (StackValue)4);
        Stack_Push(stack, (StackValue)5);
        Stack_Push(stack, (StackValue)6);
        
        Stack_Print(stack);
        
        Stack_Pop(stack);
        Stack_Print(stack);
        
        Stack_Top(stack);
        Stack_Print(stack);
    }
    return 0;
}
