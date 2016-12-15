//
//  TJStudentListDataModel.h
//  网络封装Demo
//
//  Created by kairu on 16/8/25.
//  Copyright © 2016年 kairu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class parent_avatars;
@interface TJStudentListDataModel : NSObject

// 学生ID
@property(nonatomic,strong)NSString *Id;
// 学生姓名
@property(nonatomic,strong)NSString *name;
// 头像
@property(nonatomic,strong)NSString *img;
// 性别
@property(nonatomic,strong)NSString *sex;
// 所在班级
@property(nonatomic,strong)NSString *class_id;
// 状态
@property(nonatomic,strong)NSString *stu_status;
/// 学号.
@property(nonatomic,strong)NSString *stunum;
//
@property(nonatomic,strong)parent_avatars *parent_avatar;
//
@property(nonatomic,strong)NSString *parent_name;
//
@property(nonatomic,strong)NSString *parent_sex;
//
@property(nonatomic,strong)NSString *parent_mobile;
//
@property(nonatomic,strong)NSString *parent_areainfo;
//
@property(nonatomic,strong)NSString *parent_areacode;
//
@property(nonatomic,copy)NSString *parent_uid;
//
@property(nonatomic,copy)NSString *parent_accid;

@end


#pragma mark --- 当前班级的学生列表Model ---
@interface parent_avatars : NSObject
//
@property(nonatomic,strong)NSString *avatar32;
//
@property(nonatomic,strong)NSString *avatar64;
//
@property(nonatomic,strong)NSString *avatar128;
//
@property(nonatomic,strong)NSString *avatar256;
//
@property(nonatomic,strong)NSString *avatar512;
@end