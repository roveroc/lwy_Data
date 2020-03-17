//
//  Tool.h
//  BMEnShiYiLiao
//
//  Created by 岳漪凡 on 16/2/17.
//  Copyright © 2016年 LIUWEI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMUtilMacro.h"

@interface Tools : NSObject


//检测是否为中文
+ (BOOL) validateChinese:(NSString *)str;

/**
 *  弹出提示框仿Android提示
 *
 *  @param message 无返回值
 */
+(void)showMessage:(NSString *)message;

/**
 *  首次打开APP检测版本信息
 */
//-(void)didFinishLaunchcheckVersionNotes;
/**
 *  判断是否为空 YES：空  NO：非空
 *
 *  @return YES：空  NO：非空
 */
+(BOOL) isBlankString:(NSString *)string;
/**
 *  验证是否只包含汉字或者字母
 *
 *  @param str 需要验证的zifc
 *
 *  @return 该字符串是否满足要求
 */
+ (BOOL)isChineseOrLetter:(NSString *)str;
/**
 *  进行MD5加密（16位）
 *
 *  @param inPutText 需要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *) md5: (NSString *) inPutText;

/**
 *  MD5加密（32位）
 *
 *  @param input 需要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+ (NSString *)md5by32:(NSString*)input;

/**
 *  验证手机号码
 *
 *  @param tel 需要验证的手机号码
 *
 *  @return 是否是手机号码
 */
+ (BOOL)isValidateTel:(NSString *)tel;
/**
 *  验证密码6-16位数字或字母
 *
 *  @param candidate 需要验证的密码
 *
 *  @return 是否是需要的密码
 */
+ (BOOL) validatePWD: (NSString *) candidate;
/**
 *  验证邮箱
 *
 *  @param mail 需要验证的邮箱
 *
 *  @return 是否是邮箱
 */
+(BOOL)validateMail:(NSString *)mail;
/**
 *  验证输入是否为空或者输入全部为空格
 *
 *  @param obj 手机号
 *
 *  @return 结果
 */

+(BOOL)isNilOrNull:(id)obj;
/**
 *  验证身份证号
 *
 *  @param value 需要验证的身份证号
 *
 *  @return 是否是正确的身份证号
 */
+ (BOOL)validateIDCardNumber:(NSString *)value;
#pragma mark -验证用户名是否合法
/**
 *  用户名是否合法，验证规则：
 *  只含有汉字、数字、字母、下划线不能以下划线开头和结尾
 *
 *  @return YES：合法 NO：不合法
 */
- (BOOL)isValidUsername;
#pragma mark -时间和字符串相互转化
/**
 *  日期转化为字符串
 *
 *  @param date 日期
 *
 *  @return 日期字符串 e.g. @"2015-07-13"
 */
+ (NSString *)dateStringFromDate:(NSDate *)date;

/**
 *  日期转化为时间
 *
 *  @param date 日期
 *
 *  @return 时间字符串 e.g. @"23:14"
 */
+ (NSString *)timeStringFromDate:(NSDate *)date;

/**
 *  日期转化为年月日＋时间
 *
 *  @param date 日期
 *
 *  @return 年月日时间 e.g. @"2015-07-17 23:14"
 */
+ (NSString *)dateTimeStringFromDate:(NSDate *)date;
+(NSString*)createTimeFromDate:(NSDate *)date;
/**
 *  日期比较
 *
 
 */
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
/**
 *  字符串转时间 @"20110826134106"
 *
 *  @param string eg:@"20110826134106"
 *
 *  @return date
 */
+(NSDate *)stringFromatData:(NSString *)string;
/**
 *  字符串转时间 @"2011-08-26 13:41"
 *
 *  @param string eg:@"2011-08-26 13:41"
 *
 *  @return date
 */
+(NSDate *)stringFromatData1:(NSString *)string;
/*!
 * @brief 把字典转换成格式化的JSON格式的字符串
 * @param dict 字典
 * @return JSON格式的字符串
 */
+ (NSString *)jasonStringWithDictonary:(NSDictionary *)dict;
/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/*
 *  小网页安全加密方法
 *
 *  @param dictionary 需要传入参数的字典
 *
 *  @return 排序后MD5加密的字符串
 */
+(NSString *)webViewParameterWithDictionary:(NSDictionary*)dictionary Key:(NSString*)key;
/*
 *  只返回SIGN
 *
 *  @param dictionary 需要传入参数的字典
 *
 *  @return 排序后MD5加密的字符串
 */

+(NSString *)toSign:(NSDictionary*)dictionary Key:(NSString*)key;

/*
 *   ec商城加密
 *
 *  @param dictionary 需要传入参数的字典 和 key值
 *
 *  @return 排序后MD5加密的大写字符串
 */

+(NSString *)ECShopMD5:(NSDictionary*)dictionary Key:(NSString*)key;

/**
 *  动态计算文本所占区域大小
 *
 *  @return  CGSize
 */
+ (CGSize)sizeFromText:(NSString*)text
              withFont:(UIFont*)font
                inSize:(CGSize)superSize;
#pragma mark - URL编码
+ (NSString *)urlCodingToUTF8ByUrlString:(NSString *)urlString;
#pragma mark - URL解码
+ (NSString *)urlDecodingToUrlStringByUTF8String:(NSString *)utf8String;

/**
 *  时间戳转时间
 *
 *  @param timesTamp 时间戳
 *  @param formatStr 时间格式
 *
 *  @return 时间
 */
+(NSString *)timestamp2DateStrWith:(NSString *)timesTamp withFormatter:(NSString *)formatStr;

//+(NSString *)getDeviceId;

+(NSString *)getScreensize;

+ (NSString *)getMacaddress;

+(NSString *)networkInfo;

+(NSString *)getcarrierName;
/**
 根据Url 获取图片尺寸
 
 @param imageURL 图片链接
 @return 图片size
 */
+(CGSize)getImageSizeWithURL:(id)imageURL;
/**
 *  截取URL中的参数
 *
 *  @return NSMutableDictionary parameters
 */
+(NSMutableDictionary *)getURLParametersWithURLString:(NSString *)string;

/**
 *  密码必须包含大小写字母，数字的组合,长度在7-15之间
 *
 *  @return NSMutableDictionary parameters
 */
+ (NSString*)isOrNoPasswordStyle:(NSString *)passWordName;
//保证字符串包含一个数字
+(BOOL)isValidateOneNum:(NSString*)num;
/**
 *  处理时间 eg:2015-12-01T00:00:00
 *
 *  @return 20151201
 */
+(NSString *)TimeCutWithTime:(NSString *)time;
/**
 *  //判断当前整个字符串是否是网址链接
 *
 *  @return NSMutableDictionary parameters
 */

+ (BOOL)isUrlAddress:(NSString *)url;
/**
 *  //判断当前字符串是否包含网址链接,是则返回网址所在的NSRange,这样可以相应的操作(NSAttributedString去设置高亮等等)
 *
 *  @return NSMutableDictionary parameters
 */
+ (NSRange)getRangeOfEmailAddress:(NSString *)email;
/*
 * 隐藏手机号中间4位数
 */

+(NSString *)numberSuitScanf:(NSString*)number;
/**
 
 根据Url 获取图片尺寸 iOS
 @param imageURL 图片链接
 @return 图片宽高
 */
+(CGSize)getImageSizeWithURL:(id)imageURL;

/**
 获取当前时间

 @return   YYYYMMDD
 */
+(NSString *)getLocalTimeWithDateFormatter:(NSString*)formatter;

#pragma mark - 判断文件是否已经在沙盒中已经存在
+(BOOL) isFileExist:(NSString *)fileName;

/**
 调整图片大小通过背景图片来设置导航栏背景
 
 @param img 原图
 @param size 要调整的size
 @return 调整后的image
 */
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
+ (UIColor *) colorFromHexCode:(NSString *)hexString;


/**
 计算文本长度

 @param text <#text description#>
 @param font <#font description#>
 @return <#return value description#>
 */
+ (CGFloat )widthForLabel:(NSString *)text fontSize:(CGFloat)font;




/**
 只设置上面2个圆角，下面是直角

 @param view 要修改的view
 @param radius 圆角大小
 @return 修改好的view
 */
+(UIView*)topRadiusView:(UIView*)view with:(CGFloat)radius;

//处理边角图片 UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight
+(UIView *)setRadiusView:(UIView *)view cornerRadii:(CGSize)size;

/**
 获取当前的UIViewController
 
 @return 当前的UIViewController
 */
+ (UIViewController *)topViewController;

/**
 * 开始到结束的时间差
 @param startTime 开始时间
 @param endTime 结束时间
 @return 时间差
 */
+(NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;

#pragma mark- 裁剪图片
+(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

// 根据输入的日期转换成星期
+(NSString *)convertDateToWeekDay:(NSDate *)inputDate;

// 获取指定时间内的所有日期
+ (NSArray*)getDatesWithStartDateStr:(NSString *)startDate endDateStr:(NSString *)endDate;
// 获取指定时间内的所有日期
+ (NSArray*)getDatesWithStartDate:(NSDate *)start endDate:(NSDate *)end;

/**
 对含有表情的字符串进行编码，方便上传给服务端
 
 @param emojStr 含有表情的字符串.
 */
+ (NSString *)encodeEmoj:(NSString *)emojStr;
/**
 解码服务器返回的含有表情的字符串，方便移动端显示
 
 @param serviceStr 服务器返回的字符串
 */
+ (NSString *)decodeEmoj:(NSString *)serviceStr;

#pragma mark-富文本转html字符串
+ (NSString *)attriToStrWithAttri:(NSAttributedString *)attri;
#pragma mark-字符串转富文本
+ (NSAttributedString *)strToAttriWithStr:(NSString *)htmlStr;

//根据传过来的文字内容，文字大小，和最大尺寸动态计算文字所占用的size

+ (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize;

//字符串 转Unicode
+ (NSString *)utf8ToUnicode:(NSString *)string;
//Unicode 转字符串
+ (NSString *)replaceUnicode:(NSString *)aUnicode;
//HTML适配图片文字
+ (NSString *)adaptWebViewForHtml:(NSString *) htmlStr;
//给View添加边框线
+ (void)addBorderLineToView:(UIView *)view BorderColor:(UIColor *)color BorderWidth:(CGFloat)width;
 
@end
