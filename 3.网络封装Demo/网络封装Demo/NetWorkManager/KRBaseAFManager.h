//
//  KRBaseAFManager.h
//  网络封装Demo
//
//  Created by kairu on 16/8/25.
//  Copyright © 2016年 kairu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

/// 深圳测试服务器
#define KR_SERVER       @"http://apit.ifoodsoso.cn/api/"

// 返回的代码块(成功/失败).
typedef void(^returnBlock)(BOOL sucessful, id objc);

@interface KRBaseAFManager : AFHTTPSessionManager

/**
 *  获得单列请求对象.
 *
 *  @return 返回单列请求对象
 */
+ (KRBaseAFManager *)shareBaseAFManager;

/**
 *  GET方法请求
 *
 *  @param URLString 请求的URL地址
 *  @param parameter 请求的参数
 *  @param success   请求成功的回调代码块
 *  @param failure   请求失败
 */
- (void)GET:(NSString *)URLString parameters:(id)parameters
    success:(returnBlock)success
    failure:(returnBlock)failure;

/**
 *  POST方法请求
 *
 *  @param URLString 请求的URL地址
 *  @param parameter 请求的参数
 *  @param success   请求成功的回调代码块
 *  @param failure   请求失败
 */
- (void)Post:(NSString *)URLString
  parameters:(id)parameters
    progress:(void(^)(CGFloat progress)) progress
     success:(returnBlock)success
     failure:(returnBlock)failure;

/**
 *  上传请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param progress   进度值回调.
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
- (void)Upload:(NSString *)URLString
    parameters:(id)parameters
      progress:(void(^)(CGFloat progress)) progress
       success:(returnBlock)success
       failure:(returnBlock)failure;

@end
