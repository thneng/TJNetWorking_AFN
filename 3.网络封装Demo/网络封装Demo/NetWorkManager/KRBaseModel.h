//
//  KRBaseModel.h
//  网络封装Demo
//
//  Created by kairu on 16/8/25.
//  Copyright © 2016年 kairu. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef void(^ReturnValueBlock)(id returnValue);
typedef void(^ProgressBlock)(CGFloat progress);
@interface KRBaseModel : NSObject

//数据成功返回回调
@property (nonatomic, copy) ReturnValueBlock successBlock;
/// 失败返回回调
@property (nonatomic, copy) ReturnValueBlock failureBlock;
/// 进度值的回调.
@property (nonatomic, copy) ProgressBlock progressBlock;


// 设置请求回调,由子类去实现.
- (void)setBlockWithprogress:(ProgressBlock) progressBlock
                WithSuccessBlock:(ReturnValueBlock) successBlock
                WithFailureBlock:(ReturnValueBlock) failureBlock;

@end
