//
//  Tool.m
//  BMEnShiYiLiao
//
//  Created by 岳漪凡 on 16/2/17.
//  Copyright © 2016年 LIUWEI. All rights reserved.
//



#import "Tools.h"
#import "CommonCrypto/CommonDigest.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>


static id _instance;
//appstore
#define APPIdentifier @""

@interface Tools()<UIAlertViewDelegate>

@property(nonatomic,retain) NSString *APPStoreURL;

@end

@implementation Tools


#pragma mark - 检测是否为中文   
+ (BOOL) validateChinese:(NSString *)str
{
    NSString *pwdRegex = @"^[\u4E00-\u9FA5]*$";
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pwdRegex];
    
    return [pwdTest evaluateWithObject:str];
}

#pragma mark - 判断是否为空

// return YES：空  NO：非空

+(BOOL) isBlankString:(NSString *)string {
    
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

#pragma mark 弹出提示框仿Android提示
+(void)showMessage:(NSString *)message
{
    if ([message isEqualToString:@""])
    {
        return;
    }
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview = [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 290, 20)];
    // NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15]};
    
    //CGSize LabelSize = [message boundingRectWithSize:CGSizeMake(290, MAXFLOAT)
    // options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesDeviceMetrics
    //attributes:attributes
    // context:nil].size;
    
    //    DEF_DEBUG(@"LabelSize W == %f",LabelSize.width);
    
    //    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    [label sizeToFit];
    [showview addSubview:label];
    showview.frame = CGRectMake((DEF_SCREEN_WIDTH - DEF_FRAME_W(label) - 20)/2, DEF_SCREEN_HEIGHT- 100, DEF_FRAME_W(label)+20, DEF_FRAME_H(label)+10);
    [UIView animateWithDuration:2 animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}

//#pragma mark 首次打开APP检测版本信息
//-(void)didFinishLaunchcheckVersionNotes
//{
//    [APPVersionCheck isAppVersionUpdatedWithAppIdentifier:APPIdentifier updatedInformation:^(NSString *releaseNoteText, NSString *releaseVersionText, NSDictionary *resultDic) {
//        
//        [Tools showMessage:[NSString stringWithFormat:@"已更新版本:%@", releaseVersionText]];
//        
//    } latestVersionInformation:^(NSString *releaseNoteText, NSString *releaseVersionText, NSDictionary *resultDic) {
//        UIAlertView *createUserResponseAlert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"有新版本:%@", releaseVersionText] message:releaseNoteText delegate:self cancelButtonTitle:@"忽略" otherButtonTitles: @"进行下载", @"下次再说",nil];
//        _APPStoreURL = [resultDic objectForKey:@"trackViewUrl"];
//        createUserResponseAlert.tag = 1102;
//        [createUserResponseAlert show];
//    } completionBlockError:^(NSError *error) {
//        DEF_DEBUG(@"An error occurred: %@", [error localizedDescription]);
//    }];
//}
//
#pragma mark - 验证是否只包含汉字和字母
+ (BOOL)isChineseOrLetter:(NSString *)str
{
    //电话号码正则表达式（支持手机号码，3-4位区号，7-8位直播号码，1－4位分机号）
    //    NSString *regex = @"((\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$)";
    //NSString *regex = @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+";
    //NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    NSString *regex = @"[a-zA-Z\u4e00-\u9fa5]+";
    NSPredicate *telTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",regex];
    return [telTest evaluateWithObject:str];
}

- (BOOL)isValidUsername{
    NSString *userNameRegex = @"^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNamePredicate evaluateWithObject:self];
}
#pragma mark - MD5加密（16）
+(NSString *) md5: (NSString *) inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (int)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}
#pragma mark -  md5加密-32位 (小写)
+ (NSString *)md5by32:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

#pragma mark - 验证手机号码和电话号码的正则表达式
+ (BOOL)isValidateTel:(NSString *)tel
{
    //电话号码正则表达式（支持手机号码，3-4位区号，7-8位直播号码，1－4位分机号）

//    NSString *regex = @"^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\\d{8}$";
//    NSPredicate *telTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",regex];
//    return [telTest evaluateWithObject:tel];
    
   
    NSString *CM = @"^(134|135|136|137|138|139|150|151|152|157|158|159|178|147|182|183|184|187|188|198)[0-9]{8}$";
    NSString *CU        = @"^(130|131|132|155|156|166|185|186|175|176|145)[0-9]{8}$";
    NSString *CT        = @"^(133|149|153|189|177|173|180|181|199)[0-9]{8}$";
    
    //
    //  NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    // BOOL res1 = [regextestmobile evaluateWithObject:tel];
    BOOL res2 = [regextestcm evaluateWithObject:tel];
    BOOL res3 = [regextestcu evaluateWithObject:tel];
    BOOL res4 = [regextestct evaluateWithObject:tel];
    
    if (res2 || res3 || res4 )
    {
        return YES;
    }
    
    return NO;
    
}

#pragma mark - 验证密码 6~18位数字或字母
+ (BOOL) validatePWD: (NSString *) candidate {
    NSString *pwdRegex = @"^[a-zA-Z0-9]{6,18}$";
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pwdRegex];
    
    return [pwdTest evaluateWithObject:candidate];
}

#pragma mark - 保证字符串包含一个数字
//保证字符串包含一个数字
//    ^开始标记
//    (?=.*\\d) 保证字符串包含一个数字
//    (?=.*[a-z]) 保证字符串一个小写字母
//    (?=.*[A-Z]) 保证字符串包含一个大写字母
//    [0-9a-zA-Z]{6,16} 保证字符串长度为6-16
//    $结束标记
+(BOOL)isValidateOneNum:(NSString*)num
{
    NSString *str =@"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{7,15}$";
    
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [pwdTest evaluateWithObject:num];
    
}

#pragma mark - 验证邮箱
+(BOOL)validateMail:(NSString *)mail
{
    //    NSString *mailRegex = @"^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$";
    NSString *mailRegex = @"^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
    NSPredicate *mailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mailRegex];
    
    return [mailTest evaluateWithObject:mail];
    
}

#pragma mark - 验证身份证号
+ (BOOL)validateIDCardNumber:(NSString *)value
{
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    int length =0;
    if (!value) {
        return NO;
    }else {
        length = (int)value.length;
        
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            if(numberofMatch >0) {
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                }else {
                    return NO;
                }
                
            }else {
                return NO;
            }
        default:
            return false;
    }
}
/**
 *  验证输入是否为空或者输入全部为空格
 *
 *  @param str 手机号
 *
 *  @return 结果
 */

+(BOOL)isNilOrNull:(id)obj{
    
    
    BOOL isNull = NO;
    
    if (obj == nil || [obj isKindOfClass:[NSNull class]]) {
        isNull = YES;
    }
    else {
        if ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSMutableString class]]) {
            if ([[(NSString *)obj stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
                isNull = YES;
            }
        }
    }
    
    return isNull;
}
#pragma mark -时间和字符串相互转化

+ (NSString *)dateStringFromDate:(NSDate *)date{
    @autoreleasepool {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"YYYY年MM月dd日";
        return [formatter stringFromDate:date];
    }
}

+ (NSString *)timeStringFromDate:(NSDate *)date{
    @autoreleasepool {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"MM月dd";
        return [formatter stringFromDate:date];
    }
}

+ (NSString *)dateTimeStringFromDate:(NSDate *)date{
    @autoreleasepool {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"YYYY-MM-dd HH:mm";
        return [formatter stringFromDate:date];
    }
}

+(NSString*)createTimeFromDate:(NSDate *)date
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    return [df stringFromDate:date];
}


/**
 *  日期比较
 *
 *  @param oneDay
 *  @param anotherDay
 *
 *  @return
 */
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    DEF_DEBUG(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //DEF_DEBUG(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //DEF_DEBUG(@"Date1 is in the past");
        return -1;
    }
    //DEF_DEBUG(@"Both dates are the same");
    return 0;
    
}
/**
 *  字符串转时间
 *
 *  @param string eg:@"YYYY-MM-dd"
 *
 *  @return date
 */
+(NSDate *)stringFromatData:(NSString *)string
{
    //    NSString*string = @20110826134106;
    
    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate*inputDate = [inputFormatter dateFromString:string];
    
    return inputDate;
}

+(NSDate *)stringFromatData1:(NSString *)string
{
    //    NSString*string = @20110826134106;
    
    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate*inputDate = [inputFormatter dateFromString:string];
    
    return inputDate;
}

//获取当前时间（字符串）
+(NSString *)getLocalTimeWithDateFormatter:(NSString*)formatter
{   NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    if ([self isNilOrNull:dateFormatter]) {
        formatter =@"yyyy-MM-dd";
    }
    [dateFormatter setDateFormat:formatter];
    NSString *destDateString = [dateFormatter stringFromDate:localeDate];
    
    return destDateString;
}
/*!
 * @brief 把字典转换成格式化的JSON格式的字符串
 * @param dict 字典
 * @return JSON格式的字符串
 */
+ (NSString *)jasonStringWithDictonary:(NSDictionary *)dict
{
    if ([NSJSONSerialization isValidJSONObject:dict]) {
//        NSData *jasonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:NULL];
//        NSString *jasonString = [[NSString alloc]initWithData:jasonData encoding:NSUTF8StringEncoding];
//        return jasonString;
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
        
    }
    return @"字典数据数据有误!";
}


/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        DEF_DEBUG(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


#pragma mark - 动态计算文本所占区域大小
/**
 *  动态计算文本所占区域大小
 *
 *  @param text      文本
 *  @param font      字体
 *  @param superSize 所绘制区域的范围
 *
 *  @return 区域大小
 */
+ (CGSize)sizeFromText:(NSString*)text
              withFont:(UIFont*)font
                inSize:(CGSize)superSize
{
    return [text boundingRectWithSize:superSize
                              options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:@{NSFontAttributeName: font}
                              context:nil].size;
}
#pragma mark - URL编码
+ (NSString *)urlCodingToUTF8ByUrlString:(NSString *)urlString
{
    return [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - URL解码
+ (NSString *)urlDecodingToUrlStringByUTF8String:(NSString *)utf8String
{
    return [utf8String stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

/**
 *  时间戳转时间
 *
 *  @param timesTamp 时间戳
 *  @param formatStr 时间格式
 *
 *  @return 时间
 */
+(NSString *)timestamp2DateStrWith:(NSString *)timesTamp withFormatter:(NSString *)formatStr
{
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init]; \
    [dateformatter setDateFormat:formatStr]; \
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timesTamp longLongValue]/1000]; \
    NSString *dateStr = [dateformatter stringFromDate:date];
    
    return dateStr;
}



+(NSString *)getScreensize
{
    //分辨率
    CGRect rect_screen = [[UIScreen mainScreen]bounds];
    CGSize size_screen = rect_screen.size;
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    
    return [NSString stringWithFormat:@"%.fx%.f",size_screen.width*scale_screen,size_screen.height*scale_screen];
}
//运营商
+(NSString *)getcarrierName{
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    NSString *currentCountry=[carrier carrierName];
    DEF_DEBUG(@"%@ [carrier isoCountryCode]==%@,[carrier allowsVOIP]=%d,[carrier mobileCountryCode=%@,[carrier mobileCountryCode]=%@",currentCountry,[carrier isoCountryCode],[carrier allowsVOIP],[carrier mobileCountryCode],[carrier mobileNetworkCode]);
    
    return currentCountry;
}

+(NSString *)networkInfo
{
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    DEF_DEBUG(@"%@", networkInfo.currentRadioAccessTechnology);
    
    return networkInfo.currentRadioAccessTechnology;
}

+ (NSString *)getMacaddress
{
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    //    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    DEF_DEBUG(@"outString:%@", outstring);
    
    free(buf);
    
    return [outstring uppercaseString];
}

/**
 *  截取URL中的参数
 *
 *  @return NSMutableDictionary parameters
 */
+(NSMutableDictionary *)getURLParametersWithURLString:(NSString *)string {
    
    // 查找参数
    NSRange range = [string rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        return nil;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    // 截取参数
    NSString *parametersString = [string substringFromIndex:range.location + 1];
    
    // 判断参数是单个参数还是多个参数
    if ([parametersString containsString:@"&"]) {
        
        // 多个参数，分割参数
        NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];
        
        for (NSString *keyValuePair in urlComponents) {
            // 生成Key/Value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            
            // Key不能为nil
            if (key == nil || value == nil) {
                continue;
            }
            
            id existValue = [params valueForKey:key];
            
            if (existValue != nil) {
                
                // 已存在的值，生成数组
                if ([existValue isKindOfClass:[NSArray class]]) {
                    // 已存在的值生成数组
                    NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    
                    [params setValue:items forKey:key];
                } else {
                    
                    // 非数组
                    [params setValue:@[existValue, value] forKey:key];
                }
                
            } else {
                
                // 设置值
                [params setValue:value forKey:key];
            }
        }
    } else {
        // 单个参数
        
        // 生成Key/Value
        NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];
        
        // 只有一个参数，没有值
        if (pairComponents.count == 1) {
            return nil;
        }
        
        // 分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        
        // Key不能为nil
        if (key == nil || value == nil) {
            return nil;
        }
        
        // 设置值
        [params setValue:value forKey:key];
    }
    
    return params;
}
+(NSString *)TimeCutWithTime:(NSString *)time
{
    NSString * string = [time substringToIndex:10];
    if([string rangeOfString:@"-"].location!=NSNotFound)
    {
        string = [string stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    
    return string;
    
}
/**
 *  //判断当前整个字符串是否是网址链接
 *
 *  @return NSMutableDictionary parameters
 */

+ (BOOL)isUrlAddress:(NSString *)url
{
    NSString *reg = @"/^(http|https)://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$/";
    NSPredicate *urlPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reg];
    return [urlPredicate evaluateWithObject:url];
}
/**
 *  //判断当前字符串是否包含网址链接,是则返回网址所在的NSRange,这样可以相应的操作(NSAttributedString去设置高亮等等)
 *
 *  @return NSMutableDictionary parameters
 */
+ (NSRange)getRangeOfEmailAddress:(NSString *)email
{
    NSString *re = @"/^(http|https)://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$/";
    NSRange range = [email rangeOfString:re options:NSRegularExpressionSearch];
    if (range.location != NSNotFound) {
        return range;
    }
    else {
        return NSMakeRange(0, 0);
    }
}
/*
 * 隐藏手机号中间4位数
 */

+(NSString *)numberSuitScanf:(NSString*)number{

    if ([Tools isValidateTel:number]) {//如果是手机号码的话
        
        NSString *numberString = [number stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        
        return numberString;
        
    }
    
    return number;
    
}

/**
 
 根据Url 获取图片尺寸 iOS

 @param imageURL 图片链接
 @return 图片宽高
 */
+(CGSize)getImageSizeWithURL:(id)imageURL
{
    NSURL* URL = nil;
    if([imageURL isKindOfClass:[NSURL class]]){
        URL = imageURL;
    }
    if([imageURL isKindOfClass:[NSString class]]){
        URL = [NSURL URLWithString:imageURL];
    }
    if(URL == nil)
        return CGSizeZero;                  // url不正确返回CGSizeZero
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    NSString* pathExtendsion = [URL.pathExtension lowercaseString];
    
    CGSize size = CGSizeZero;
    if([pathExtendsion isEqualToString:@"png"]){
        size =  [self getPNGImageSizeWithRequest:request];
    }
    else if([pathExtendsion isEqual:@"gif"])
    {
        size =  [self getGIFImageSizeWithRequest:request];
    }
    else{
        size = [self getJPGImageSizeWithRequest:request];
    }
    if(CGSizeEqualToSize(CGSizeZero, size))                    // 如果获取文件头信息失败,发送异步请求请求原图
    {
        
        NSData* data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:URL] returningResponse:nil error:nil];
        
        UIImage* image = [UIImage imageWithData:data];
        if(image)
        {
            size = image.size;
        }
    }
    return size;
}
//  获取PNG图片的大小
+(CGSize)getPNGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 8)
    {
        int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        [data getBytes:&w3 range:NSMakeRange(2, 1)];
        [data getBytes:&w4 range:NSMakeRange(3, 1)];
        int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
        int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
        [data getBytes:&h1 range:NSMakeRange(4, 1)];
        [data getBytes:&h2 range:NSMakeRange(5, 1)];
        [data getBytes:&h3 range:NSMakeRange(6, 1)];
        [data getBytes:&h4 range:NSMakeRange(7, 1)];
        int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
//  获取gif图片的大小
+(CGSize)getGIFImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 4)
    {
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        short w = w1 + (w2 << 8);
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(2, 1)];
        [data getBytes:&h2 range:NSMakeRange(3, 1)];
        short h = h1 + (h2 << 8);
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
//  获取jpg图片的大小
+(CGSize)getJPGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if ([data length] <= 0x58) {
        return CGSizeZero;
    }
    
    if ([data length] < 210) {// 肯定只有一个DQT字段
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        short w = (w1 << 8) + w2;
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        short h = (h1 << 8) + h2;
        return CGSizeMake(w, h);
    } else {
        short word = 0x0;
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
        if (word == 0xdb) {
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
            if (word == 0xdb) {// 两个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            } else {// 一个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
        } else {
            return CGSizeZero;
        }
    }
}

#pragma mark - 计算内容文本的高度方法
+ (CGFloat)HeightForText:(NSString *)text withFontSize:(CGFloat)fontSize withTextWidth:(CGFloat)textWidth
{
    // 获取文字字典
    NSDictionary *dict = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    // 设定最大宽高
    CGSize size = CGSizeMake(textWidth, 2000);
    // 计算文字Frame
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return frame.size.height;
}

#pragma mark - 判断文件是否已经在沙盒中已经存在
+(BOOL) isFileExist:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    DEF_DEBUG(@"这个文件已经存在：%@",result?@"是的":@"不存在");
    return result;
}

/**
 调整图片大小通过背景图片来设置导航栏背景

 @param img 原图
 @param size 要调整的size
 @return 调整后的image
 */
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, 100000, 100)];
//    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    return img;
}
+ (UIColor *) colorFromHexCode:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat )widthForLabel:(NSString *)text fontSize:(CGFloat)font
{
    CGSize size = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName, nil]];
    return size.width;
}


+(UIView*)topRadiusView:(UIView*)view with:(CGFloat)radius{
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = view.bounds;
    maskLayer.path = bezierPath.CGPath;
    view.layer.mask = maskLayer;
    view.layer.masksToBounds = YES;
    return view;
}
//处理边角图片 UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight
+(UIView *)setRadiusView:(UIView *)view cornerRadii:(CGSize)size
{
    
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, DEF_FRAME_W(view), DEF_FRAME_H(view)) byRoundingCorners: UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:size];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = view.bounds;
//    maskLayer.path = maskPath.CGPath;
//    view.layer.mask = maskLayer;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = size.width;
    return view;
}




/**
 获取当前的UIViewController

 @return 当前的UIViewController
 */
+ (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

/**
 * 开始到结束的时间差
 @param startTime 开始时间
 @param endTime 结束时间
 @return 时间差
 */
+(NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime{
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *startD =[date dateFromString:startTime];
    NSDate *endD = [date dateFromString:endTime];
    NSTimeInterval start = [startD timeIntervalSince1970]*1;
    NSTimeInterval end = [endD timeIntervalSince1970]*1;
    NSTimeInterval value = end - start;
    int second = (int)value %60;//秒
    int minute = (int)value /60%60;
    int house = (int)value / (24 *3600)%3600;
    int day = (int)value / (24 *3600);
    NSString *str;
    if (day != 0) {
        str = [NSString stringWithFormat:@"耗时%d天%d小时%d分%d秒",day,house,minute,second];
    }else if (day==0 && house !=0) {
        str = [NSString stringWithFormat:@"耗时%d小时%d分%d秒",house,minute,second];
    }else if (day==0 && house==0 && minute!=0) {
        str = [NSString stringWithFormat:@"耗时%d分%d秒",minute,second];
    }else{
        str = [NSString stringWithFormat:@"耗时%d秒",second];
    }
   
    return [NSString stringWithFormat:@"%d", day*24*60*60+house*60*60+minute*60+second];
}

#pragma mark- 裁剪图片
+(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

// 根据输入的日期转换成星期
+(NSString *)convertDateToWeekDay:(NSDate *)inputDate{
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    NSInteger idx = theComponents.weekday-1;
    if (idx<0) {
        idx = 6;
    }
    NSString *strWeekDay = [weekdays objectAtIndex:idx];
    
    return strWeekDay;
}

// 获取指定时间内的所有日期
+ (NSArray*)getDatesWithStartDateStr:(NSString *)startDate endDateStr:(NSString *)endDate {
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    
    //字符串转时间
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    matter.dateFormat = @"yyyy-MM-dd";
    NSDate *start = [matter dateFromString:startDate];
    NSDate *end = [matter dateFromString:endDate];
    
    NSMutableArray *componentAarray = [NSMutableArray array];
    NSComparisonResult result = [start compare:end];
    NSDateComponents *comps;
    while (result != NSOrderedDescending) {
        comps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |  NSCalendarUnitWeekday fromDate:start];
        [componentAarray addObject:start];
        
        //后一天
        [comps setDay:([comps day]+1)];
        start = [calendar dateFromComponents:comps];
        
        //对比日期大小
        result = [start compare:end];
    }
    return componentAarray;
}

// 获取指定时间内的所有日期
+ (NSArray*) getDatesWithStartDate:(NSDate *)start endDate:(NSDate *)end {
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    
    NSMutableArray *componentAarray = [NSMutableArray array];
    NSComparisonResult result = [start compare:end];
    NSDateComponents *comps;
    while (result != NSOrderedDescending) {
        comps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |  NSCalendarUnitWeekday fromDate:start];
        [componentAarray addObject:start];
        
        //后一天
        [comps setDay:([comps day]+1)];
        start = [calendar dateFromComponents:comps];
        
        //对比日期大小
        result = [start compare:end];
    }
    return componentAarray;
}



/**
 对含有表情的字符串进行编码，方便上传给服务端
 
 @param emojStr 含有表情的字符串.
 */
+ (NSString *)encodeEmoj:(NSString *)emojStr
{
  
    if (!emojStr) {
        return @"";
    }
    if (DEF_iOS9) {
        emojStr = [emojStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
        
    }else{
        
        emojStr = [emojStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
    }
    return emojStr;
}

/**
 解码服务器返回的含有表情的字符串，方便移动端显示
 
 @param serviceStr 服务器返回的字符串
 */
+ (NSString *)decodeEmoj:(NSString *)serviceStr
{
  
    if (!serviceStr) {
        return @"";
    }
    if (DEF_iOS9) {
        serviceStr = [serviceStr stringByRemovingPercentEncoding];
    }else{
        serviceStr = [serviceStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    return serviceStr;
   
}


//字符串 转Unicode
+ (NSString *)utf8ToUnicode:(NSString *)string{
    NSUInteger length = [string length];
    NSMutableString *str = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++){
        NSMutableString *s = [NSMutableString stringWithCapacity:0];
       // unichar _char = [string characterAtIndex:i];
        // 判断是否为英文和数字
//        if (_char <= '9' && _char >='0'){
//
//            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
//        }else if(_char >='a' && _char <= 'z'){
//            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
//        }else if(_char >='A' && _char <= 'Z')
//        {
//            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
//        }else{
        //
            // 中文和字符
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
            // 不足位数补0 否则解码不成功
            if(s.length == 4) {
                [s insertString:@"00" atIndex:2];
            } else if (s.length == 5) {
                [s insertString:@"0" atIndex:2];
            }
      //  }
        //mankeng zzk
        [str appendFormat:@"%@", s];
    }
    return str;

    
}
//Unicode 转字符串
+ (NSString *)replaceUnicode:(NSString *)aUnicode
{
    if (!aUnicode||aUnicode.length<=0) {
        return @"";
    }
    NSString *tempStr1 = [aUnicode stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2]stringByAppendingString:@"\""];
    
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
   
}
                          

#pragma mark-富文本转html字符串
/**
 *  富文本转html字符串
 */
+ (NSString *)attriToStrWithAttri:(NSAttributedString *)attri{
    NSDictionary *tempDic = @{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,
                              NSCharacterEncodingDocumentAttribute:[NSNumber numberWithInt:NSUTF8StringEncoding]};
    NSData *htmlData = [attri dataFromRange:NSMakeRange(0, attri.length)
                         documentAttributes:tempDic
                                      error:nil];
    return [[NSString alloc] initWithData:htmlData
                                 encoding:NSUTF8StringEncoding];
}
#pragma mark-字符串转富文本
/**
 *  字符串转富文本
 */
+ (NSAttributedString *)strToAttriWithStr:(NSString *)htmlStr{
    return [[NSAttributedString alloc] initWithData:[htmlStr dataUsingEncoding:NSUnicodeStringEncoding]
                                            options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType}
                                 documentAttributes:nil
                                              error:nil];
}



//根据传过来的文字内容，文字大小，和最大尺寸动态计算文字所占用的size

+ (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize

{
    if (!text||text.length<=0) {
        return CGSizeMake(0, 0);
    }
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
    
    NSDictionary* attributes =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    //如果系统为iOS7.0；
    
    CGSize labelSize;
    
    if (![text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]){
        
        labelSize = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping];
        
    }
    
    //如果是IOS6.0
    
    　else
        
        　　{
            
            labelSize = [text boundingRectWithSize: maxSize
                         
                                           options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine
                         
                                        attributes:attributes
                         
                                           context:nil].size;
            
        }
    
    labelSize.height=ceil(labelSize.height);
    
    labelSize.width=ceil(labelSize.width);
    
    return labelSize;
    
}

//HTML适配图片文字
+ (NSString *)adaptWebViewForHtml:(NSString *) htmlStr
{
    NSMutableString *headHtml = [[NSMutableString alloc] initWithCapacity:0];
    [headHtml appendString : @"<html>" ];
    
    [headHtml appendString : @"<head>" ];
    
    [headHtml appendString : @"<meta charset=\"utf-8\">" ];
    
    [headHtml appendString : @"<meta id=\"viewport\" name=\"viewport\" content=\"width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=false\" />" ];
    
    [headHtml appendString : @"<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />" ];
    
    [headHtml appendString : @"<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />" ];
    
    [headHtml appendString : @"<meta name=\"black\" name=\"apple-mobile-web-app-status-bar-style\" />" ];
    
    // [headHtml appendString : @"<span><img src=\"image@3x.png\"  alt=\"图片\" /></span><span class=\"s4\"><br><br></span>" ];
    
    
    
    //适配图片宽度，让图片宽度等于屏幕宽度
    //[headHtml appendString : @"<style>img{width:100%;}</style>" ];
    //[headHtml appendString : @"<style>img{height:auto;}</style>" ];
    
    //适配图片宽度，让图片宽度最大等于屏幕宽度
    //    [headHtml appendString : @"<style>img{max-width:100%;width:auto;height:auto;}</style>"];
    
    
    //适配图片宽度，如果图片宽度超过手机屏幕宽度，就让图片宽度等于手机屏幕宽度，高度自适应，如果图片宽度小于屏幕宽度，就显示图片大小
    [headHtml appendString : @"<script type='text/javascript'>"
     "window.onload = function(){\n"
     "var maxwidth=document.body.clientWidth;\n" //屏幕宽度
     "for(i=0;i <document.images.length;i++){\n"
     "var myimg = document.images[i];\n"
     "if(myimg.width > maxwidth){\n"
     "myimg.style.width = '100%';\n"
     "myimg.style.height = 'auto'\n;"
     "}\n"
     "}\n"
     "}\n"
     "</script>\n"];
    
    [headHtml appendString : @"<style>table{width:100%;}</style>" ];
    [headHtml appendString : @"<title>webview</title>" ];
    NSString *bodyHtml;
    bodyHtml = [NSString stringWithString:headHtml];
    bodyHtml = [bodyHtml stringByAppendingString:htmlStr];
    return bodyHtml;
    
}
//给View添加边框线
+ (void)addBorderLineToView:(UIView *)view BorderColor:(UIColor *)color BorderWidth:(CGFloat)width
{
    view.layer.borderColor = color.CGColor;
    view.layer.borderWidth = width;
}
 
@end

