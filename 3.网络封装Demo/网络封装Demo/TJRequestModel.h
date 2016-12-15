//
//  TJRequestModel.h
//  网络封装Demo
//
//  Created by kairu on 16/8/25.
//  Copyright © 2016年 kairu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KRBaseAFManager.h"
#import "KRBaseModel.h"
@interface TJRequestModel : KRBaseModel

#pragma mark - 获取学生列表请求.
/// 请求参数.
@property (nonatomic, strong) NSMutableDictionary *studentListParame;
/// 请求方法.
-(void)requestForStudentList;


@end
