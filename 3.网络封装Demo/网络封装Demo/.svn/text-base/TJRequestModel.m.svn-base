//
//  TJRequestModel.m
//  网络封装Demo
//
//  Created by kairu on 16/8/25.
//  Copyright © 2016年 kairu. All rights reserved.
//

#import "TJRequestModel.h"
#import "MJExtension.h"
#import "TJStudentListDataModel.h"

@implementation TJRequestModel
#pragma mark - 获取学生列表请求.
/// 请求参数.
-(NSMutableDictionary *)studentListParame{
    
    if (!_studentListParame) {
        _studentListParame = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":@"6acd2005bb519dfb4d5f9e0d3cb6d760",
                                                                             @"open_id":@"7x38fH7tPcmuQ3qhPJKd9KFv0cNFkc6TMymkt2r6JyhqOcNpTemmQyMY1",
                                                                             @"method":@"GET",
                                                                             @"class_id":@"32514",
                                                                             @"pageSizes":@"10",
                                                                             @"page":@"1"}];
    }
    
    return _studentListParame;
}

/// 请求方法.
-(void)requestForStudentList {

    [[KRBaseAFManager shareBaseAFManager] Post:@"get_student" parameters:self.studentListParame progress:nil success:^(BOOL sucessful, id objc) {
        if (sucessful && self.successBlock) {
               // 可在此解析数据...
            NSMutableArray *students = [NSMutableArray array];
            if ([objc isKindOfClass:[NSArray class]]) {
                for (NSDictionary *dic in objc) {
                    
                    /// 用MJExtension解析.
                    [students addObject:[TJStudentListDataModel mj_objectWithKeyValues:dic]];
                }
            }
            /// 回调数据.
            self.successBlock(students);
        }
        
    } failure:^(BOOL sucessful, id objc) {
        if (self.failureBlock) {
            self.failureBlock(objc);
        }
    }];
}

@end
