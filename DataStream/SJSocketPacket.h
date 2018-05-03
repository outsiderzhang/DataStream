//
//  SJSocketPacket.h
//  DataStream
//
//  Created by sanjia on 2018/5/3.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SJSocketByteBuf.h"
#import "SJSocketPacketType.h"
@interface SJSocketPacket : NSObject

/**
 数据包类型(0-4)
 */
@property (nonatomic, assign) SJSocketPacketType packetType;

/**
 数据包
 */
@property (nonatomic, strong) SJSocketByteBuf *packetByte;

@end

@interface SJUpstreamPacket : SJSocketPacket

/**
 初始化上行数据包

 @param packetType 数据包类型
 @param data 数据包实体
 @return self
 */
- (instancetype)initWithPacketType:(SJSocketPacketType)packetType data:(NSData *)data;

@end

@interface SJDownstreamPacket : SJSocketPacket

/**
 数据包实体
 */
@property (nonatomic, strong, readonly) NSData *data;

/**
 根据服务器推送数据初始化下行数据包

 @param data 服务器推送数据
 @return self(下行数据包对象)
 */
- (instancetype)initWithData:(NSData *)data;
@end
