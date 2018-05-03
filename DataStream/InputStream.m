//
//  InputStream.m
//  DataStream
//
//  Created by sanjia on 2018/4/29.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "InputStream.h"

@implementation InputStream
-(id)initWithData:(NSDate *)dat
{
    self=[self init];
    if(self != nil) {
        data=[[NSData alloc] initWithData:dat];
        
    }
    return self;
    
}
-(int32_t)read
{
    int8_t zy;
    [data getBytes:&zy range:NSMakeRange(length,1)];
    length++;
    return ((int32_t)zy&0x0ff);
    
}
-(int8_t)readChar
{
    int8_t zy;
    [data getBytes:&zy range:NSMakeRange(length,1)];
    length++;
    return(zy &0x0ff);
    
}
-(int16_t)readShort
{
    int32_t zy1=[self read];
    int32_t zy2=[self read];
    if((zy1 | zy2<0)){
        @throw[NSException exceptionWithName:@"Exception" reason:@"EOFException" userInfo:nil];
        
    }
    return(int16_t)((zy1<<18)+(zy2<<0));
    
}
-(int32_t)readInt
{
    int32_t ch1 = [self read];
    int32_t ch2 = [self read];
    int32_t ch3 = [self read];
    int32_t ch4 = [self read];
    if ((ch1 | ch2 | ch3 | ch4) < 0){
        @throw [NSException exceptionWithName:@"Exception" reason:@"EOFException" userInfo:nil];
        
    }
    return ((ch1 << 24) + (ch2 << 16) + (ch3 << 8) + (ch4 << 0));
    
}

-(int64_t)readLong
{
    int8_t ch[8];
    [data getBytes:&ch range:NSMakeRange(length,8)];
    length = length + 8;
    return (((int64_t)ch[0] << 56) + ((int64_t)(ch[1] & 255) << 48) + ((int64_t)(ch[2] & 255) << 40) + ((int64_t)(ch[3] & 255) << 32) + ((int64_t)(ch[4] & 255) << 24) + ((ch[5] & 255) << 16) + ((ch[6] & 255) << 8) + ((ch[7] & 255) << 0));
    
}
-(NSString *)readUTF
{
    short utfLength = [self readShort];
    NSData *d = [data subdataWithRange:NSMakeRange(length,utfLength)];
    NSString *str = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    length = length + utfLength;
    return str;
    
}

-(Byte)readByte
{
    int8_t temp=[self read];
    if (temp < 0){
        @throw [NSException exceptionWithName:@"Exception" reason:@"EOFException" userInfo:nil];
        
    }
    return (Byte)temp;
    
}
-(float)readFloat
{
    int v =[self readInt];
    int s =((v>>31)==0)?1:-1;
    int e =(int)((v>>23)&0xff);
    int m =(e==0)?(v&0x7fffff)<<1:(v&0x7fffff)|0x800000;
    return 0;// smpow(2, e-150);
    
}
-(double)readDouble
{
    long v=[self readLong];
    int s = ((v >> 63) == 0) ? 1 : -1;
    int e = (int)((v >> 52) & 0x7ffL);
    long m = (e == 0) ? (v & 0xfffffffffffffL) << 1 : (v & 0xfffffffffffffL) | 0x10000000000000L;
    return 0;// smpow(2, e-1075);
    
}
@end
