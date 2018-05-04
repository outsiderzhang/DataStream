//
//  SJSocketByteBuf.m
//  DataStream
//
//  Created by sanjia on 2018/5/2.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "SJSocketByteBuf.h"

@implementation SJSocketByteBuf

//初始化
- (instancetype)init
{
    if (self = [super init]) {
        _buffer = [[NSMutableData alloc] init];
    }
    return self;
}

//初始化
- (instancetype)initWithData:(NSData *)data
{
    if (self = [super init]) {
        _buffer = [[NSMutableData alloc] initWithData:data];
    }
    return self;
}

//读取缓存池数据
- (NSData *)data
{
    return _buffer;
}

//读取缓存池长度
- (NSInteger)length
{
    return _buffer.length;
}

//清空缓存池
- (void)clear
{
    _buffer = [[NSMutableData alloc] init];
}
@end

static NSInteger ByteLength     =       1;
static NSInteger ShortLength    =       2;
static NSInteger IntLength      =       4;
static NSInteger LongLength     =       8;

@implementation SJSocketByteBuf (NSInteger)
#pragma mark -- byte(消息类型)    Byte[2](消息长度)    Byte[]消息内容
//写入缓存池 消息长度 int16_t(2byte) 转成 2个int8_t(1byte)
- (void)writeInt8WithInt16:(int16_t)int16
{
    int8_t len[2];
    len[0] = (int16 & 0xff);
    len[1] = (int16 & 0xff) >> 8;
    [_buffer appendBytes:len length:2];
}

//读取缓存池 获取消息长度 2个int8_t(1byte) 转成 int16_t(2byte)
- (int16_t)readInt16FromInt8
{
    //index:1 length:2
    NSAssert(3 <= _buffer.length, @"index > _buffer.length");
    int8_t len[2];
    [_buffer getBytes:len range:NSMakeRange(1, 2)];
    int16_t l = (int16_t)(len[0] & 0xff);
    int16_t h = (int16_t)(len[1] & 0xff);
    return (l | (h << 8));
}
//====================//

//int8_t(1byte) 写入缓存池
- (void)writeInt8:(int8_t)int8
{
    [_buffer appendBytes:&int8 length:ByteLength];
}

//int16_t(2byte) 写入缓存池
- (void)writeInt16:(int16_t)int16
{
    [_buffer appendBytes:&int16 length:ShortLength];
}

//int32_t(4byte) 写入缓存池
- (void)writeInt32:(int32_t)int32
{
    [_buffer appendBytes:&int32 length:IntLength];
}

//int64_t(8byte) 写入缓存池
- (void)writeInt64:(int64_t)int64
{
    [_buffer appendBytes:&int64 length:LongLength];
}


//读取缓存池指定位置(index)指定长度(int8_t)数据
- (int8_t)readInt8:(NSUInteger)index
{
    NSAssert(index + ByteLength <= _buffer.length, @"index > _buffer.length");
    
    int8_t value = 0;
    [_buffer getBytes:&value range:NSMakeRange(index, ByteLength)];
    return value;
}

//读取缓存池指定位置(index)指定长度(int16_t)数据
- (int16_t)readInt16:(NSUInteger)index
{
    NSAssert(index + ShortLength <= _buffer.length, @"index > _buffer.length");
    
    int8_t value = 0;
    [_buffer getBytes:&value range:NSMakeRange(index, ShortLength)];
    return value;
}

//读取缓存池指定位置(index)指定长度(int32_t)数据
- (int32_t)readInt32:(NSUInteger)index
{
    NSAssert(index + IntLength <= _buffer.length, @"index > _buffer.length");
    
    int8_t value = 0;
    [_buffer getBytes:&value range:NSMakeRange(index, IntLength)];
    return value;
}

//读取缓存池指定位置(index)指定长度(int64_t)数据
- (int64_t)readInt64:(NSUInteger)index
{
    NSAssert(index + LongLength <= _buffer.length, @"index > _buffer.length");
    
    int8_t value = 0;
    [_buffer getBytes:&value range:NSMakeRange(index, LongLength)];
    return value;
}

@end

@implementation SJSocketByteBuf (NSData)
//写入NSData类型数据
- (void)writeData:(NSData *)data
{
    if (data.length == 0) {
        return;
    }
    [_buffer appendData:data];
}
//读取缓存池指定位置(index)指定长度(length)NSData类型数据
- (NSData *)readData:(NSUInteger)index length:(NSUInteger)length
{
    NSAssert(index + length <= _buffer.length, @"index > _buffer.length");
    
    return [_buffer subdataWithRange:NSMakeRange(index, length)];
}
@end

@implementation SJSocketByteBuf (NSString)

//写入NSString类型数据
- (void)writeString:(NSString *)string
{
    if (string.length == 0) {
        return;
    }
    
    [_buffer appendBytes:string.UTF8String length:string.length];
}

//读取缓存池指定位置(index)指定长度(length)NSString类型数据
- (NSString *)readString:(NSUInteger)index length:(NSUInteger)length
{
    NSAssert(index + length <= _buffer.length, @"index > _buffer.length");
    
    return [[NSString alloc] initWithData:[_buffer subdataWithRange:NSMakeRange(index, length)] encoding:NSUTF8StringEncoding];
}
@end
