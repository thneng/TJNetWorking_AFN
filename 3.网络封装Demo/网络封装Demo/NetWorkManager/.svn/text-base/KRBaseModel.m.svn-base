//
//  KRBaseModel.m
//  网络封装Demo
//
//  Created by kairu on 16/8/25.
//  Copyright © 2016年 kairu. All rights reserved.
//

#import "KRBaseModel.h"

@implementation KRBaseModel

- (void)setBlockWithprogress:(ProgressBlock) progressBlock
            WithSuccessBlock:(ReturnValueBlock) successBlock
            WithFailureBlock:(ReturnValueBlock) failureBlock
{
    _progressBlock = progressBlock;
    _successBlock = successBlock;
    _failureBlock = failureBlock;
}


- (void)dealloc
{
    _progressBlock = nil;
    _successBlock = nil;
    _failureBlock = nil;
}


@end
