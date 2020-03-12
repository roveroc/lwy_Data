//
//  BM_NetAPIManager.h
//  BM
//
//  Created by 刘世财 on 15/3/3.
//  Copyright (c) 2015年 BM. All rights reserved.
//

#import <Foundation/Foundation.h>

/**< 显示接口返回的消息 **/
#define DEF_SHOWMESSAGE [MBProgressHUD showSuccess:responseData[@"retDesc"]];

#define DEF_SHOWMSGString(string) [MBProgressHUD showSuccess:string];

/**< 网络错误，请稍后再试 **/
#define DEF_REQUESTERROR [MBProgressHUD showErrorMessage:@"网络错误，请稍后再试"];

/**< 图片链接 **/
#define DEF_SHOWURLIMAGE(string)  [DEF_NETIMGPATH_BASEURL stringByAppendingString:string]

typedef void (^BMNetAPIResponceBlock)(id data ,NSError* error);

@interface BM_NetAPIManager : NSObject

+ (instancetype)sharedManager;

@end
