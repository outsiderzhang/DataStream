//
//  InputStream.h
//  DataStream
//
//  Created by sanjia on 2018/4/29.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputStream : NSObject
{
    NSData *data; //这个数据就不解释了，接受到的数据
    NSInteger length;//长度

}
    
//初始化
-(id)initWithData:(NSData *)dat;

//读取一个字节的数据
-(Byte)readByte;

//读取一个char的数据
-(int8_t)readChar;

//读取short
-(int16_t)readShort;

//读取一个int
-(int32_t)readInt;

//读取一个long
-(int64_t)readLong;

//读取一个字符串
-(NSString *)readUTF;

//读取一个float
-(float)readFloat;

//读取一个double
-(double)readDouble;
@end
