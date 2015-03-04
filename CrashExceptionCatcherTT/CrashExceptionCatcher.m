//
//  CrashExceptionCatcher.m
//  CrashExceptionCatcherTT
//
//  Created by zhoushejun on 15-1-20.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

#import "CrashExceptionCatcher.h"

// 提交异常Log信息
void uncaughtExceptionHandler(NSException *exception) {
    // 异常Log信息
    NSString *logInfo = [NSString stringWithFormat:@"Crash:\n%@\nStack Trace:\n%@\n", [exception description], [exception callStackSymbols]];
    NSLog(@"%@", logInfo);
    // TODO: 提交服务器收集
    // ....
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"logInfo.text"];
    NSString *logFilePath = [documentDirectory stringByAppendingPathComponent:fileName];
    // 先删除已经存在的文件
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    [defaultManager removeItemAtPath:logFilePath error:nil];
    if ([defaultManager createFileAtPath:logFilePath contents:[logInfo dataUsingEncoding:NSUTF8StringEncoding] attributes:nil]) {
        NSLog(@"OK");
    }else {
        NSLog(@"NO");
    }
}

@implementation CrashExceptionCatcher

+ (void)startCrashExceptionCatch{
    // Sets the top-level error-handling function where you can perform. last-minute logging before the program terminates.
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler); //设置异常Log信息的处理
}

@end
