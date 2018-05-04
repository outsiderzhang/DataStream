//
//  SJSocketConnectParam.m
//  DataStream
//
//  Created by sanjia on 2018/5/4.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "SJSocketConnectParam.h"

@implementation SJSocketConnectParam
- (instancetype)init
{
    if (self = [super init]) {
        _host = nil;
        _port = 0;
        _imToken = nil;
        _timeout = 15;
        _heartbeatEnabled = NO;
        _heartbeatInterval = 30;
        _autoReconnect = YES;
        _connectMaxCount = 100;
        _connectInterval = 5;
    }
    return self;
}
@end
