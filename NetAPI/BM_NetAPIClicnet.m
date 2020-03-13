//
//  BM_NetAPIClicnet.m
//  LPBM
//
//  Created by liusc on 15/3/3.
//  Copyright (c) 2015年 BM. All rights reserved.
//

#import "BM_NetAPIClicnet.h"
#import <CommonCrypto/CommonDigest.h>
#import "MBProgressHUD.h"
#import "BMUtilMacro.h"

@implementation BM_NetAPIClicnet

+ (BM_NetAPIClicnet *)sharedJsonClient {
    static BM_NetAPIClicnet *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[BM_NetAPIClicnet alloc] initWithBaseURL:[NSURL URLWithString:DEF_NETPATH_BASEURL]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
//    self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions: NSJSONReadingMutableContainers];

    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/html", @"text/javascript", @"text/json",@"text/plain; charset=utf-8",nil];
    //[self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self.requestSerializer setValue:[[NSUserDefaults standardUserDefaults]objectForKey:@"token"] forHTTPHeaderField:@"token"];
  //  [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    self.requestSerializer.timeoutInterval = 10;
    
//    self.securityPolicy.allowInvalidCertificates = YES;
    
    return self;
}





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
                       andBlock:(void (^)(id data, NSError *error))block{
    
    DEFLog(@"接口所需要的参数----%@",params);
    
 
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //是否需要loading加载框
    MBProgressHUD *hud;
    if(isLoading)
    {
//        hud = [MBProgressHUD createMBProgressHUDviewWithMessage:DEF_ALERTMESSAGE isWindiw:YES];
        hud.label.numberOfLines=0;
//        hud.dimBackground = MBProgressHUDBackgroundStyleSolidColor; //设置有遮罩
        hud.label.text = DEF_ALERTMESSAGE; //设置进度框中的提示文字
        
//        hud =[MBProgressHUD showHUDAddedTo:target.view animated:YES];
//
//        // 显示模式,改成customView,即显示自定义图片(mode设置,必须写在customView赋值之前)
//        hud.mode = MBProgressHUDModeCustomView;
//        hud.contentColor = [UIColor clearColor];
//        // 设置要显示 的自定义的图片
//        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"load"]];
//        hud.customView.backgroundColor = [UIColor clearColor];
//         hud.backgroundColor = [UIColor clearColor];
//        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//        hud.bezelView.backgroundColor = [UIColor clearColor];
//
//        // 显示的文字,比如:加载失败...加载中...
//        hud.label.text = @"";//DEF_ALERTMESSAGE;
//        // 标志:必须为YES,才可以隐藏,  隐藏的时候从父控件中移除
//        hud.removeFromSuperViewOnHide = YES;
       
       
    }
    
   
       
//    [target hiddenNonetWork];
    //发起请求
    switch (NetworkMethod) {
        case Get:{
            
            [self GET:aPath parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            }
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  DEF_DEBUG(@"\n===========responseObject===========\n aPath = %@:\n responseObject = %@ \n", aPath, responseObject);
                  
                  [hud hide:YES afterDelay:0];
                  block(responseObject, nil);
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
                  DEF_DEBUG(@"\n===========error===========\n aPath = %@:\n error = %@ \n", aPath, error);
                  
                  [hud hide:YES afterDelay:0];
                  block(nil, error);
              }];
            break;
        }
        case Post:{
            
            
            [self POST:aPath parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                DEF_DEBUG(@"\n===========responseObject===========\n aPath = %@:\n responseObject = %@ \n", aPath, responseObject);
          
//                NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:responseObject options:nil error:nil];
//                NSLog(@"!!!!!!!!!!!!!!!!!!!!!   %@",json);
                [hud hide:YES afterDelay:0];
                
                block(responseObject, nil);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DEF_DEBUG(@"\n===========error===========\n aPath = %@:\n error = %@ \n", aPath, error);
                
                DEF_DEBUG(@"error ---- - = %@",task);
                
                hud.label.text = @"当前网络异常，请稍后再试";
                [hud hide:YES afterDelay:0.5];
                block(nil, error);
            }];
            
            
            break;
        }
    }
}

/**
 *  异步POST请求:以body方式,支持数组
 *
 *  @param url     请求的url
 *  @param body    body数据
 *  @param show    是否显示HUD
 */
- (void)postWithUrl:(NSString *)url WithTarget:(UIViewController*)target body:(NSData *)body showLoading:(BOOL)show andBlock:(void (^)(id data, NSError *error))block
{
    DEF_WeakSelf(self);
    MBProgressHUD *hud;
    if(show)
    {
//        hud = [MBProgressHUD createMBProgressHUDviewWithMessage:DEF_ALERTMESSAGE isWindiw:YES];
        hud.label.numberOfLines=0;
        //        hud.dimBackground = MBProgressHUDBackgroundStyleSolidColor; //设置有遮罩
        hud.label.text = DEF_ALERTMESSAGE; //设置进度框中的提示文字
        
//        hud =[MBProgressHUD showHUDAddedTo:target.view animated:YES];
//
//        // 显示模式,改成customView,即显示自定义图片(mode设置,必须写在customView赋值之前)
//        hud.mode = MBProgressHUDModeCustomView;
//        hud.contentColor = [UIColor clearColor];
//        // 设置要显示 的自定义的图片
//        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"load"]];
//        hud.customView.backgroundColor = [UIColor clearColor];
//        hud.backgroundColor = [UIColor clearColor];
//        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//        hud.bezelView.backgroundColor = [UIColor clearColor];
//
//        // 显示的文字,比如:加载失败...加载中...
//        hud.label.text = @"";//DEF_ALERTMESSAGE;
//        // 标志:必须为YES,才可以隐藏,  隐藏的时候从父控件中移除
//        hud.removeFromSuperViewOnHide = YES;
    }
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@", DEF_NETPATH_BASEURL, url];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:requestUrl parameters:nil error:nil];
    request.timeoutInterval= 30;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    // 设置body
    [request setHTTPBody:body];
    NSLog(@"request.URL = %@\n request.HTTPBody = %@",request.URL, request.HTTPBody);
    
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        
        
        if (!error) {
            NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:responseObject options:nil error:nil];
            if (show) {
                [hud hide:YES afterDelay:0];
            }
          
            block(json, nil);
            
        } else {
            hud.label.text = @"当前网络异常，请稍后再试";
            [hud hide:YES afterDelay:0.5];
            block(nil, error);
        }
    }] resume];
}


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
                       andBlock:(void (^)(id data, NSError *error))block{
    
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:aPath parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:filePath_] name:name fileName:fileName mimeType:@"application/octet-stream" error:nil];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印下上传进度
        DEF_DEBUG(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //请求成功
        DEF_DEBUG(@"请求成功：%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求失败
        DEF_DEBUG(@"请求失败：%@",error);
    }];
}

/**
 *  AFN3.0 下载
 */
- (void)requestDownLoadWithFilePath:(NSString *)filePath withReportId:(NSString *)reportId  andBlock:(BMNetAPIResponceBlock)block
{

    
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.确定请求的URL地址
    NSURL *url = [NSURL URLWithString:filePath];
    
    //3.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //打印下下载进度
        DEF_DEBUG(@"%lf",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //下载地址
        
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@",reportId]];
        DEF_DEBUG(@"%@",[NSURL fileURLWithPath:path]);
        return [NSURL fileURLWithPath:path];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //下载完成调用的方法
        if (error) {
             block(nil, error);
        }else
        {
             block([filePath path], nil);
        }

    }];
    
    //开始启动任务
    [task resume];
}




// 上传图片
-(void)requestImageDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                  withImageData:(id)data
                  withFieldName:(NSString *)fieldName
               withObjectClassz:(Class)classz
                    withLoading:(BOOL)isLoading
                       andBlock:(BMNetAPIResponceBlock)block
{
    MBProgressHUD *hud;
    if(isLoading)
    {
//        hud = [MBProgressHUD createMBProgressHUDviewWithMessage:@"图片上传中..." isWindiw:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.numberOfLines=0;
    }

    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    DEF_DEBUG(@"\n===========request===========\n%@    \n%@ ", aPath, params);
    [self POST:aPath
    parameters:params
constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//    [formData appendPartWithFileData:data name:@"datafile" fileName:@"" mimeType:@"image/png"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *imageName = [NSString stringWithFormat:@"%@.jpeg", str];
   // NSString *imageName = [NSString stringWithFormat:@"%@.png", str];
    NSArray *imgArray;
    if ([data isKindOfClass:[NSArray class]])
    {
        imgArray = [NSArray arrayWithArray:data];
        
    }else
    {
        imgArray = [NSArray arrayWithObject:data];
    }
    for (int i=0; i<imgArray.count; i++) {
        NSData *data = UIImageJPEGRepresentation(imgArray[i],0.5);
        //NSData *data = UIImagePNGRepresentation(imgArray[i]);
        [formData appendPartWithFileData:data
                                    name:fieldName
                                fileName:imageName
        // mimeType:@"image/png"];
                            mimeType:@"image/jpeg"];
    }
}
      progress:^(NSProgress * _Nonnull uploadProgress) {
          DEF_DEBUG(@"%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
      }
       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           //请求成功
           DEF_DEBUG(@"请求成功：%@",responseObject);
            block(responseObject, nil);
            [hud hide:YES afterDelay:0];
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           //请求失败
           DEF_DEBUG(@"请求失败：%@",error);
            block(nil, error);
           hud.label.text = @"当前网络异常，请稍后再试";
           
           [hud hide:YES afterDelay:0];
       }];
}
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}



@end
