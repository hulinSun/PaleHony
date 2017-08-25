//
//  main.m
//  SubstringSearch
//
//  Created by Hony on 2017/8/25.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import <Foundation/Foundation.h>


// 子字符串搜索

NSInteger violenceSubSearch(NSString *sourceString, NSString *subString);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
        NSString *sourceStr = @"violencesearch";
        NSString *subStr = @"search";
    
        NSUInteger pos = violenceSubSearch(sourceStr, subStr);
        NSLog(@"%ld",pos);
        
    }
    return 0;
}




/**
 暴力搜索

 @param sourceString 源字符串
 @param subString 子字符串
 @return 返回是否找到 0 没找到  非0为找到
 */
NSInteger violenceSubSearch(NSString *sourceString, NSString *subString){
    
    // 查找search
    NSUInteger m = subString.length;
    NSUInteger n = sourceString.length;
    
    for (NSUInteger i = 0; i <= n - m; i++) {
        NSUInteger j;
        for (j = 0; j < m; j ++) {
            if ([subString characterAtIndex:j ] != [sourceString characterAtIndex:j + i]) {
                break;
            }
            // 找到头了
            if (j == m - 1) {
                // 0 1 2 3 4 5  ==> search
                return i ;
            }
        }
    }
    
    return 0;
}




