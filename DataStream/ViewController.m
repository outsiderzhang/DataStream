//
//  ViewController.m
//  DataStream
//
//  Created by sanjia on 2018/4/29.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ViewController.h"

#import "SJSocketPacket.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSInteger length1 = 16;
//    int8_t len1[2];
//    len1[0] = (int8_t)(length1 & 0xff);
//    len1[1] = (int8_t)((length1 >>8) & 0xff);
//
//    NSData *data1 = [NSData dataWithBytes:&len1 length:2];
//
//    int16_t length2 = 16;
//
//    int16_t length3 = HTONS(length2);
//    NSData *data2 = [NSData dataWithBytes:&length2 length:2];
//    NSData *data3 = [NSData dataWithBytes:&length3 length:2];
//
//    NSLog(@"data1:%@ data2:%@ data3:%@", data1, data2, data3);
    
    //消息类型
    Byte type[1];
    type[0] = 4;
    
    //消息长度
    Byte len[2];
    len[0] = (Byte)(2 & 0xff);
    len[1] = (Byte)((2 >> 8) & 0xff);
    
    //消息内容
    Byte content[2];
    content[0] = 52;
    content[1] = 43;
    
    //组装
    NSMutableData *heart = [[NSMutableData alloc] init];
    [heart appendBytes:type length:1];
    [heart appendBytes:len length:2];
    [heart appendBytes:content length:2];
    NSLog(@"心跳:%@", heart);
    
    SJDownstreamPacket *downStream = [[SJDownstreamPacket alloc] initWithData:heart];
    NSLog(@"type:%d data:%@", downStream.packetType, downStream.data);
    
//    NSString *string = @"123";
//    int16_t bytes[2];
//    bytes[0] = 8;
//    bytes[1] = 4;
//    NSData *data = [NSData dataWithBytes:&bytes length:4];
//    SJUpstreamPacket *upstream = [[SJUpstreamPacket alloc] initWithPacketType:SJSocketPacketHeartReply data:data];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
