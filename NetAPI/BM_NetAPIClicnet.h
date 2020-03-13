//
//  BM_NetAPIClicnet.h
//  LPBM
//
//  Created by liusc on 15/3/3.
//  Copyright (c) 2015年 BM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "BM_NetAPIManager.h"
#define DEF_ALERTMESSAGE @"加载中..."

typedef enum {
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;

@interface BM_NetAPIClicnet : AFHTTPSessionManager

+ (BM_NetAPIClicnet *)sharedJsonClient;

/**
 *  NetWorking
 *
 *  @param aPath         接口路径
 *  @param params        接口所需要的参数
 *  @param NetworkMethod 请求类型
 *  @param isLoading     是否需要loading框
 *  @param block         返回数据和错误信息
 */
- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary *)params
                     withTarget:(UIViewController*)target
                 withMethodType:(int)NetworkMethod
                    withLoading:(BOOL)isLoading
                       andBlock:(void (^)(id data, NSError *error))block;

#pragma mark- 异步POST请求:以body方式,支持数组
/**
 *  异步POST请求:以body方式,支持数组
 *
 *  @param url     请求的url
 *  @param body    body数据
 *  @param show    是否显示HUD
 */
- (void)postWithUrl:(NSString *)url WithTarget:(UIViewController*)target body:(NSData *)body showLoading:(BOOL)show andBlock:(void (^)(id data, NSError *error))block;

/**
 *  AFMultipartFormData 方式上传图片
 *
 *  @param aPath        接口路径
 *  @param params       接口所需要的参数
 *  @param name         图片名称不带后缀
 *  @param fileName     图片名称带后缀
 *  @param filePath_    图片物理路径
 *  @param NetworkMetho 请求类型
 *  @param block        返回数据或者错误信息
 */
-(void)requestImageDataWithPath:(NSString *)aPath withParams:(NSDictionary*)params WithName:(NSString *)name fileName:(NSString *)fileName filePath:(NSString *)filePath_ withMethodType:(int)NetworkMetho
                       andBlock:(void (^)(id data, NSError *error))block;
// 上传图片
-(void)requestImageDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                  withImageData:(id)data
                  withFieldName:(NSString *)fieldName
               withObjectClassz:(Class)classz
                    withLoading:(BOOL)isLoading
                       andBlock:(BMNetAPIResponceBlock)block;
/**
 *  AFN3.0 下载
 */
- (void)requestDownLoadWithFilePath:(NSString *)filePath withReportId:(NSString *)reportId andBlock:(BMNetAPIResponceBlock)block;
@end
