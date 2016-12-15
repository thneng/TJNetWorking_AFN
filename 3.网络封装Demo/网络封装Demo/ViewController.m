//
//  ViewController.m
//  网络封装Demo
//
//  Created by kairu on 16/8/25.
//  Copyright © 2016年 kairu. All rights reserved.
//

#import "ViewController.h"
#import "TJRequestModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TJRequestModel *model= [TJRequestModel new];
    [model setBlockWithprogress:nil WithSuccessBlock:^(id returnValue) {
        NSLog(@"%@",returnValue);
    } WithFailureBlock:^(id returnValue) {
        NSLog(@"%@",returnValue);
    }];
    [model requestForStudentList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
