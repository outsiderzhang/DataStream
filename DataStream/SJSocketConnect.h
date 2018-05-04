//
//  SJSocketConnect.h
//  DataStream
//
//  Created by sanjia on 2018/5/4.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SJSocketConnectParam.h"
#import "SJSocketConnectDelegate.h"

/**
 *  socket网络连接对象，只负责socket网络的连接通信，内部使用GCDAsyncSocket。
 *  1-只公开GCDAsyncSocket的主要方法，增加使用的便捷性。
 *  2-封装的另一个目的是，易于后续更新调整。如果不想使用GCDAsyncSocket，只要修改内部实现即可，对外不产生影响。
 */
@interface SJSocketConnect : NSObject<SJSocketConnectDelegate>

/**
 socket连接配置信息
 */
@property (nonatomic, strong) SJSocketConnectParam *connectParam;

/**
 初始化网络连接对象

 @param connectParam socket连接配置信息
 @return 网络连接对象
 */
- (instancetype)initWithConnectParam:(SJSocketConnectParam *)connectParam;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

- (void)dispatchOnSocketQueue:(dispatch_block_t)block async:(BOOL)async;
@end
