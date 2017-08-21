//
//  main.m
//  List
//
//  Created by mac on 17/8/21.
//  Copyright © 2017年 shl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArrayList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ArrayList *list = List_Create(5);
        List_Add(list, (ArrayListNodeValue)1);
        List_Add(list, (ArrayListNodeValue)2);
        List_Add(list, (ArrayListNodeValue)3);
        List_Add(list, (ArrayListNodeValue)4);
        List_Add(list, (ArrayListNodeValue)5);
        
        List_Print(list);
        
        List_Add(list, (ArrayListNodeValue)6);
        List_Add(list, (ArrayListNodeValue)7);
        List_Print(list);
        
        List_Set(list, 1, (ArrayListNodeValue)3);
        List_Print(list);
        
//        List_Remove(list, 4);
//        List_Print(list);
        
        List_Remove_Value(list, (ArrayListNodeValue)3);
        List_Print(list);
        
    }
    return 0;
}
