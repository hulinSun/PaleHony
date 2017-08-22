//
//  main.m
//  LinkList
//
//  Created by Hony on 2017/8/22.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "LinkList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        LinkList *list = List_Create();
        List_Add(list, (LinkListNodeValue)1);
        List_Add(list, (LinkListNodeValue)2);
        List_Add(list, (LinkListNodeValue)3);
        List_Add(list, (LinkListNodeValue)4);
        List_Add(list, (LinkListNodeValue)5);
        
        List_Print(list);
        
        List_Insert(list, 3, (LinkListNodeValue)8);
        List_Print(list);
        
        List_Insert(list, 3, (LinkListNodeValue)9);
        List_Print(list);
        
        List_Add(list, (LinkListNodeValue)5);
        List_Print(list);
        
        List_Remove(list, 1);
        List_Print(list);
        
        List_Insert(list, 3, (LinkListNodeValue)9);
        
        List_Remove_Value(list, (LinkListNodeValue)5);
        List_Print(list);
        
        List_Inverse(list);
//        List_Print(list);
    }
    return 0;
}
