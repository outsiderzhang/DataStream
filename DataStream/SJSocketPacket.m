//
//  SJSocketPacket.m
//  DataStream
//
//  Created by sanjia on 2018/5/3.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "SJSocketPacket.h"

#define BYTES_TYPE        1
#define BYTES_LENGTH      2
#define BYTES_HEAD        3

@implementation SJSocketPacket

@end

@implementation SJUpstreamPacket

//初始化上行数据包
- (instancetype)initWithPacketType:(SJSocketPacketType)packetType data:(NSData *)data
{
    if (self = [super init]) {
        
        //初始化数据包类型
        self.packetType = packetType;
        //初始化数据包
        self.packetByte = [[SJSocketByteBuf alloc] init];
        
        if (data.length > 0) {
            
            //写入数据包类型
            [self.packetByte writeInt8:packetType];
            
            //写入数据包长度
            [self.packetByte writeInt8WithInt16:data.length];
            
            //写入数据包
            [self.packetByte writeData:data];
        }
    }
    return self;
}

@end

@interface SJDownstreamPacket ()
/**
 数据包实体
 */
@property (nonatomic, strong, readwrite) NSData *data;
@end
@implementation SJDownstreamPacket

//初始化下行数据包
- (instancetype)initWithData:(NSData *)data
{
    if (self = [super init]) {
        
        //根据接受数据初始化数据包
        self.packetByte = [[SJSocketByteBuf alloc] initWithData:data];
        
        //获取数据包类型
        self.packetType = [self.packetByte readInt8:0];
        
        //判断数据有效性
        if (data.length > BYTES_HEAD) {//包含数据包
            //获取数据包长度
            int16_t len = [self.packetByte readInt16FromInt8];
            
            if (len + BYTES_HEAD <= data.length) {//数据包完整验证
                //获取数据包
                self.data = [self.packetByte readData:BYTES_HEAD length:len];
            }
        }
    }
    return self;
}

@end
