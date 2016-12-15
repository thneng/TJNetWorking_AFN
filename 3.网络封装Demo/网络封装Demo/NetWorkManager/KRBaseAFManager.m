//
//  KRBaseAFManager.m
//  网络封装Demo
//
//  Created by kairu on 16/8/25.
//  Copyright © 2016年 kairu. All rights reserved.
//

#import "KRBaseAFManager.h"

@implementation KRBaseAFManager

+ (KRBaseAFManager *)shareBaseAFManager
{

    static dispatch_once_t onceToken;
    static KRBaseAFManager *baseAFManager= nil;
    dispatch_once(&onceToken, ^{
        
        /// 设置baseURL
        baseAFManager = [[KRBaseAFManager alloc] initWithBaseURL:[NSURL URLWithString:KR_SERVER]];
        /// 设置请求格式，格式为字典 k-v
        baseAFManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        /// 设置返回格式
        baseAFManager.responseSerializer = [AFJSONResponseSerializer serializer];
        /// 设置默认请求时长.
        baseAFManager.requestSerializer.timeoutInterval = 30;
        /// 设置可接受数据类型.
        baseAFManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    });
    
    return baseAFManager;
}

/**
 *  GET方法请求
 *
 *  @param URLString 请求的URL地址
 *  @param parameter 请求的参数
 *  @param success   请求成功的回调代码块
 *  @param failure   请求失败
 */
- (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(returnBlock)success
    failure:(returnBlock)failure
{
    
    [self GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
 
#pragma mark 此处与后台约定返回的jsons数据格式
            if ([responseObject[@"code"] longValue] == 200) {
                if (responseObject[@"data"]) {
                    
                    success(YES,responseObject[@"data"]);
                    
                }
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        if (error && failure) {
            failure(NO,@"服务器开小差了!");
        }
    }];
    
}

/**
 *  POST方法请求
 *
 *  @param URLString 请求的URL地址
 *  @param parameter 请求的参数
 *  @param progress  进度值回调
 *  @param success   请求成功的回调代码块
 *  @param failure   请求失败
 */
- (void)Post:(NSString *)URLString
  parameters:(id)parameters
    progress:(void(^)(CGFloat progress)) progress
     success:(returnBlock)success
     failure:(returnBlock)failure
{
    
    [self POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //回调上传进度
        if (progress) {
            
            progress((CGFloat)uploadProgress.completedUnitCount/(CGFloat)uploadProgress.totalUnitCount);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
#pragma mark 此处与后台约定返回的jsons数据格式
            if ([responseObject[@"code"] longValue] == 200) {
                if (responseObject[@"data"]) {
                    
                    success(YES,responseObject[@"data"]);
                    
                }
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error && failure) {
            failure(NO,@"服务器开小差了!");
        }
        
    }];
    
    
}

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
       failure:(returnBlock)failure
{

    [self POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress) {
            
            progress((CGFloat)uploadProgress.completedUnitCount/(CGFloat)uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
#pragma mark 此处与后台约定返回的jsons数据格式
            if ([responseObject[@"code"] longValue] == 200) {
                if (responseObject[@"data"]) {
                    
                    success(YES,responseObject[@"data"]);
                    
                }
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure(NO,@"服务器开小差了!");
        }
    }];
    
}


@end
