//
//  BM_NetAPIManager.m
//  BM
//
//  Created by 刘世财 on 15/3/3.
//  Copyright (c) 2015年 BM. All rights reserved.
//

#import "BM_NetAPIManager.h"
#import <AFNetworking/AFNetworkReachabilityManager.h>

@implementation BM_NetAPIManager

+ (instancetype)sharedManager {
    static BM_NetAPIManager *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}

/**
 *  判断网络状态
 *
 *  @return 返回状态 YES 为有网 NO 为没有网
 */
- (BOOL)checkNetState
{
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus > 0;
}

@end
