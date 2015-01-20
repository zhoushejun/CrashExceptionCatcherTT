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
}

@implementation CrashExceptionCatcher

+ (void)startCrashExceptionCatch{
    // Sets the top-level error-handling function where you can perform. last-minute logging before the program terminates.
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler); //设置异常Log信息的处理
}

@end
