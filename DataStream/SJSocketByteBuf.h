//
//  SJSocketByteBuf.h
//  DataStream
//
//  Created by sanjia on 2018/5/2.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJSocketByteBuf : NSObject

/**
 数据缓存池
 */
@property (nonatomic, strong, readonly) NSMutableData *buffer;

/**
 构造方法

 @param data 数据
 @return 当前缓存池对象
 */
- (instancetype)initWithData:(NSData *)data;

/**
 读取缓存池数据

 @return 缓存池数据
 */
- (NSData *)data;

/**
 读取缓存池长度

 @return 缓存池长度
 */
- (NSInteger)length;

/**
 清空缓存池
 */
- (void)clear;

@end

@interface SJSocketByteBuf (NSInteger)

/**
 int16_t(2byte)转成 2个int8_t(1byte) 写入缓存池

 @param int16 short
 */
- (void)writeInt8WithInt16:(int16_t)int16;

/**
 读取缓存池 2个int8_t(1byte) 转成 int16_t(2byte)

 @return short
 */
- (int16_t)readInt16FromInt8;

//====================//

/**
 int8_t(1byte) 写入缓存池

 @param int8 byte
 */
- (void)writeInt8:(int8_t)int8;

/**
 int16_t(2byte) 写入缓存池

 @param int16 short
 */
- (void)writeInt16:(int16_t)int16;

/**
 int32_t(4byte) 写入缓存池

 @param int32 int
 */
- (void)writeInt32:(int32_t)int32;

/**
 int64_t(8byte) 写入缓存池

 @param int64 long
 */
- (void)writeInt64:(int64_t)int64;


/**
 读取缓存池指定位置(index)指定长度(int8_t)数据

 @param index 指定位置
 @return 1byte数据
 */
- (int8_t)readInt8:(NSUInteger)index;

/**
 读取缓存池指定位置(index)指定长度(int16_t)数据
 
 @param index 指定位置
 @return 2byte数据
 */
- (int16_t)readInt16:(NSUInteger)index;

/**
 读取缓存池指定位置(index)指定长度(int32_t)数据
 
 @param index 指定位置
 @return 4byte数据
 */
- (int32_t)readInt32:(NSUInteger)index;

/**
 读取缓存池指定位置(index)指定长度(int64_t)数据
 
 @param index 指定位置
 @return 8byte数据
 */
- (int64_t)readInt64:(NSUInteger)index;

@end

@interface SJSocketByteBuf (NSData)


/**
 写入NSData类型数据

 @param data NSData类型数据
 */
- (void)writeData:(NSData *)data;

/**
 读取缓存池指定位置(index)指定长度(length)NSData类型数据

 @param index 指定位置
 @param length 指定长度
 @return NSData类型数据
 */
- (NSData *)readData:(NSUInteger)index length:(NSUInteger)length;

@end

@interface SJSocketByteBuf (NSString)

/**
 写入NSString类型数据

 @param string NSString类型数据
 */
- (void)writeString:(NSString *)string;

/**
 读取缓存池指定位置(index)指定长度(length)NSString类型数据

 @param index 指定位置
 @param length 指定长度
 @return NSString类型数据
 */
- (NSString *)readString:(NSUInteger)index length:(NSUInteger)length;
@end
