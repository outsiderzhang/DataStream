//
//  SocketByteBuf.h
//  DataStream
//
//  Created by sanjia on 2018/4/29.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocketByteBuf : NSObject

@property (nonatomic, strong, readonly) NSMutableData *buffer;

- (NSData *)data;

@end

@interface SocketByteBuf (NSInteger)

@end

@interface SocketByteBuf (NSData)

@end

@interface SocketByteBuf (NSString)

@end
