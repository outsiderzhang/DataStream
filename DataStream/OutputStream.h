//
//  OutputStream.h
//  DataStream
//
//  Created by sanjia on 2018/4/29.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OutputStream : NSObject
{
    NSMutableData *data;
    NSInteger length;
}

// 将一个 char 值以 1-byte 值形式写入基础输出流中，先写入高字节。
- (void)writeChar:(int8_t)v;

//将一个 short 值以 2-byte 值形式写入基础输出流中，先写入高字节。
- (void)writeShort:(int16_t)v;

//将一个 int 值以 4-byte 值形式写入基础输出流中，先写入高字节。
- (void)writeInt:(int32_t)v;

//将一个 long 值以 8-byte 值形式写入基础输出流中，先写入高字节。
- (void)writeLong:(int64_t)v;

//以与机器无关方式使用 UTF-8 修改版编码将一个字符串写入基础输出流。
- (void)writeUTF:(NSString *)v;

//将一个 NSData byte数组写入输出流中，先写入高字节。
- (void)writeBytes:(NSData *)v;

//将此转换为 byte 序列。
- (NSData *)toByteArray;

//将一个byte写入输出流
- (void)write; 
@end
