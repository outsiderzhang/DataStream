//
//  SJSocketPacketType.h
//  DataStream
//
//  Created by sanjia on 2018/5/3.
//  Copyright © 2018年 zhang. All rights reserved.
//

#ifndef SJSocketPacketType_h
#define SJSocketPacketType_h
/**
 在这里书写与服务端约定的协议号...
 */
typedef NS_ENUM(NSUInteger, SJSocketPacketType) {
    
    SJSocketPacketHeartReply                 = 0, //客户端心跳响应
    SJSocketPacketHeartSend                  = 1, //服务端心跳请求
    SJSocketPacketHostMsg                    = 2, //服务端推送的消息
    SJSocketPacketSendBody                   = 3, //客户端发送的sentbody请求
    SJSocketPacketReplyBody                  = 4, //服务端回复sentbody的响应replaybody
    
};

#endif /* SJSocketProtoType_h */
//消息结构
//byte(消息类型)    Byte[2](消息长度)    Byte[]消息内容
//无论是服务端写入或者客户端写入任何消息，其中消息头在一个消息的最前面占3位，第一位消息类型，第二和第三位消息的byte[]长度

/*
消息类型规定：
byte C_H_RS = 0;客户端心跳响应
byte S_H_RQ = 1;服务端心跳请求
byte MESSAGE = 2;服务端推送的消息
byte SENTBODY = 3;客户端发送的sentbody请求
byte REPLYBODY = 4;服务端回复sentbody的响应replaybody
*/
