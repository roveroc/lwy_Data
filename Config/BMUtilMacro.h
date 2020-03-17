//
//  BMUtilMacro.h
//  BMGouKaiXin_IOS
//
// 
//  Copyright (c) 2015年 科匠中国. All rights reserved.
//

#ifndef BMGouKaiXin_IOS_BMUtilMacro_h
#define BMGouKaiXin_IOS_BMUtilMacro_h


#define YOUMENG @"5d89ef2e0cafb2123b000c0e"//友盟appkey


/************************************BASEURL************************************/

#define DEF_NETPATH_BASEURL  @"http://192.168.110.134:8888/"  //测试环境地址
#define DEF_NETIMGPATH_BASEURL  @"https://int.xiyoucts.com/xiyou/"  //测试环境地址
//#define DEF_NETPATH_BASEURL  @"http://192.168.5.184:"  //测试环境地址

#define  PAGESIZEMAX @"10"
#define DEF_HOMEIMGPATH(imgPath) [NSString stringWithFormat:@"%@",imgPath]
/************************************BASEURL*************************************/
#define WXAPPID @"wxe967e3659a60b743"
#define wx_secret @"1f32d9df62dcad971032f4ae9fb67af5"
#define LocationCityID  @"LocationCityID" //定位城市id
#define LocationCity  @"LocationCity" //定位城市
#define Longitude     @"longitude"    //经度
#define Latitude      @"latitude"     //纬度
#define DEF_CityName  @"DEF_CityName" // 手动选择的城市
#define BM_City_Width [Tools sizeFromText:@"上海上海" withFont:[UIFont systemFontOfSize:13] inSize:CGSizeMake(9999999,999999)]
// 静态轮播图1张
#define statictopFSPager_MAX 1

#define BMStatusBarHeight   [[UIApplication sharedApplication] statusBarFrame].size.height
#define BMNavigationBarHeight   self.navigationController.navigationBar.frame.size.height
#define BMTopBarHeight  BMStatusBarHeight + BMNavigationBarHeight



#define DEF_TitleColor  [UIColor colorWithHexString:@"333333"]
#define DEF_DetailTitleColor  [UIColor colorWithHexString:@"656565"]
#define DEF_BackViewColor  [Tools colorFromHexCode:@"ffffff"]  //self.view.background
#define DEF_Back00ViewColor  [Tools colorFromHexCode:@"F7F7F7"]  //self.view.background
#define DEF_NavBackColor  DEF_RGB_COLOR(2,180,168)   //导航栏/TabbarColor
#define DEF_TabbarSelectedColor  [Tools colorFromHexCode:@"0d0d0d"]
#define DEF_DEFRedColor [UIColor colorWithHexString:@"999999"] //红色
#define DEF_DEFGreenColor [UIColor colorWithHexString:@"00B7D0"] //绿色
#define DEF_SelectedColor  [Tools colorFromHexCode:@"000000"]

//文档位置
#define DEF_DOCUMENT   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#define DEF_NoData @"暂无数据";
#define DEF_NUMBERS @"0123456789\n"
/**
 *  1、DEBUG模式下进行调试打印 输出结果标记出所在类方法与行数
 */
#ifdef DEBUG
#define DEF_DEBUG(fmt, ...)   NSLog((@"%s[Line: %d]™ " fmt), strrchr(__FUNCTION__,'['), __LINE__, ##__VA_ARGS__)
#else
#define DEF_DEBUG(...)   {}
#endif

#ifdef DEBUG

#define DEFLog( s, ... ) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(s), ##__VA_ARGS__] UTF8String] )

#else

#define DEFLog( s, ... )

#endif

//拼接字符串
#define DEF_NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]


/**
 *  2、对象是否为空
 */
#define M_FIX_NULL_STRING(_value,_default)  ([_value isEqual:[NSNull null]]||_value==nil)?_default:_value
#define ISNULL(_value)  ([_value isEqual:[NSNull null]]||_value==nil)?YES:NO
/**
 * 3、获取本地数据
 *
 *  @param view <#view description#>
 *
 *  @return <#return value description#>
 */
#define DEF_USERDEFAULT_GET(key) [[NSUserDefaults standardUserDefaults]objectForKey:key]
/**
 *  4、存储本地数据
 *
 *  @param object <#object description#>
 *  @param key    <#key description#>
 *
 *  @return <#return value description#>
 */
#define DEF_USERDEFAULT_SET(object,key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];\
[[NSUserDefaults standardUserDefaults] synchronize]
/**
 *  5、移除本地数据
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
#define DEF_USERDEFAULT_REMOVE(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];\
[[NSUserDefaults standardUserDefaults] synchronize]

//**********************************************************
/**
 *  6、时间字符串转时间戳
 *
 *  @param dateStr 时间格式的字符串
 *  @param format  时间格式
 *
 *  @return 时间戳
 */
#define DEF_DateStr2Timestamp(dateStr,format) NSDateFormatter *formatter = [[NSDateFormatter alloc] init];\
[formatter setDateFormat:format];\
NSDate *date = [formatter dateFromString:dateStr];\
[NSString stringWithFormat:@"%ld",(long)[date timeIntervalSince1970]]
/**
 *  7、时间戳转时间
 *
 *  @param timesTamp 时间戳字符串
 *  @param format  时间格式
 *
 *  @return 时间格式字符串
 */
#define DEF_Timestamp2DateStr(timesTamp,format) NSDateFormatter *formatter = [[NSDateFormatter alloc] init];\
[formatter setDateFormat:format];\
NSDate *date = [NSDate dateWithTimeIntervalSince1970:timesTamp];\
[formatter stringFromDate:date]

/**
 *  8、图片跟路径
 *
 *  @param 图片相对路径
 *
 *  @return 完整的图片路径
 */
#define DEF_ImagePath(path) [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DEF_IMAGEPATH,path]]

//**********************************************************
/**
 *  9、获取对应的类文件
 *
 *  @param StoryBoardName StoryboardName
 *  @param Identifier
 *
 *  @return 对应的UIController
 */
#define DEF_ControllerWithStoryboardName(StoryBoardName,Identifier) [[UIStoryboard storyboardWithName:StoryBoardName bundle:nil] instantiateViewControllerWithIdentifier:Identifier]

/**
 *  10、获取对应的图类文件
 *
 *  @param StoryBoardName StoryboardName
 *
 *  @return 对应的UIView
 */
#define DEF_ViewWithStoryboardName(StoryBoardName) [[NSBundle mainBundle] loadNibNamed:StoryBoardName owner:nil options:nil].lastObject

//********************************
//处理圆形图片
#define DEF_RoundView(view)  CALayer *layer = [view layer];\
[layer setMasksToBounds:YES];\
[layer setCornerRadius:CGRectGetHeight([view bounds]) / 2];



//********************************控件Frame Width Height X Y***********************************

#define kScreenWidthRatio  (DEF_SCREEN_WIDTH / 375.0)
#define kScreenHeightRatio (DEF_SCREEN_HEIGHT / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)

/**
 *  主屏的宽
 */
#define DEF_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
/**
 *  主屏的高
 */
#define DEF_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

/**
 *  主屏的size
 */
#define DEF_SCREEN_SIZE   [[UIScreen mainScreen] bounds].size

/**
 *  主屏的frame
 */
#define DEF_SCREEN_FRAME  [UIScreen mainScreen].applicationFrame
/**
 *  @brief 获取一个控件的最大Y坐标
 *
 *  @param view 视图对象
 *
 *  @return Y坐标
 */
#define DEF_FRAME_MAX_Y(view) view.frame.origin.y+view.frame.size.height

/**
 *  @brief 获取一个控件的最小Y坐标
 *
 *  @param view 视图对象
 *
 *  @return Y坐标
 */
#define DEF_FRAME_MIN_Y(view) view.frame.origin.y

/**
 *  @brief 获取一个控件的最大X坐标
 *
 *  @param view 视图对象
 *
 *  @return X坐标
 */
#define DEF_FRAME_MAX_X(view) view.frame.origin.x+view.frame.size.width

/**
 *  @brief 获取一个控件的最小X坐标
 *
 *  @param view 视图对象
 *
 *  @return X坐标
 */
#define DEF_FRAME_MIN_X(view) view.frame.origin.x

/**
 *  @brief 获取一个控件的宽度
 *
 *  @param view 视图对象
 *
 *  @return 宽度
 */
#define DEF_FRAME_W(view) view.frame.size.width

/**
 *  @brief 获取一个控件的高度
 *
 *  @param view 视图对象
 *
 *  @return 高度
 */
#define DEF_FRAME_H(view) view.frame.size.height

/**
 *  @brief 设置一个控件的X坐标
 *
 *  @param view 视图对象
 *
 *  @return void
 */
#define DEF_SET_FRAME_X(view,x) view.frame = CGRectMake(x,view.frame.origin.y,view.frame.size.width,view.frame.size.height)

/**
 *  @brief 设置一个控件的Y坐标
 *
 *  @param view 视图对象
 *
 *  @return void
 */
#define DEF_SET_FRAME_Y(view,y) view.frame = CGRectMake(view.frame.origin.x, y,view.frame.size.width,view.frame.size.height)

/**
 *  @brief 设置一个控件的高度
 *
 *  @param view 视图对象
 *
 *  @return void
 */
#define DEF_SET_FRAME_H(view,h) view.frame = CGRectMake(view.frame.origin.x,view.frame.origin.y,view.frame.size.width, h);

/**
 *  @brief 设置一个控件的宽度
 *
 *  @param view 视图对象
 *
 *  @return void
 */
#define DEF_SET_FRAME_W(view,w) view.frame = CGRectMake(view.frame.origin.x,view.frame.origin.y,w,view.frame.size.height);



//**********************************常用的一些颜色************************************
/**
 *  获取一个由RGB设置的Color
 *
 *  @param _red   红
 *  @param _green 绿
 *  @param _blue  蓝
 *
 *  @return UIColor 对象
 */
#define DEF_RGB_COLOR(_red, _green, _blue) [UIColor colorWithRed:(_red)/255.0f green:(_green)/255.0f blue:(_blue)/255.0f alpha:1]
/**
 *  获取一个由RGB设置的Color 可以设置alpha
 *
 *  @param _red   红
 *  @param _green 绿
 *  @param _blue  蓝
 *  @param _alpha 透明度
 *
 *  @return UIColor 对象
 */
#define DEF_RGBA_COLOR(_red, _green, _blue, _alpha) [UIColor colorWithRed:(_red)/255.0f green:(_green)/255.0f blue:(_blue)/255.0f alpha:(_alpha)]

/// 根据16位RBG值转换成颜色，格式:UIColorFrom16RGB(0xFF0000)
#define DEF_UIColorFrom16RGB(rgbValue,alp) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alp]


/**
 *  获取当前语言
 *
 *  @param objectAtIndex:0] <#objectAtIndex:0] description#>
 *
 *  @return 返回当前语言
 */
#define DEF_JWCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//判断是否为iPhone
#define DEF_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define DEF_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为ipod
#define DEF_IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !DEF_IS_IPAD : NO)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !DEF_IS_IPAD : NO)
//判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !DEF_IS_IPAD : NO)
//判断iphone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !DEF_IS_IPAD : NO)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !DEF_IS_IPAD : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !DEF_IS_IPAD : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !DEF_IS_IPAD : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !DEF_IS_IPAD : NO)

// 适配时用到
#define KScaleWidth(width) ((width)*(DEF_SCREEN_WIDTH/375.f))
//iPhoneX系列
#define Height_StatusBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0)
#define Height_NavBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)
#define Height_TabBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)
#define Height_NavStatusBar Height_NavBar+Height_StatusBar
/*
 *  判断当前的iPhone设备/系统版本
 */

// 判断是否为 iPhone 5SE
#define DEF_iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
// 判断是否为iPhone 6/6s
#define DEF_iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
// 判断是否为iPhone 6Plus/6sPlus
#define DEF_iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
//判断 iOS 8 或更高的系统版本
#define DEF_IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))

//是否iPhoneX YES:iPhoneX屏幕 NO:传统屏幕
#define DEF_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define DEF_kStatusBarAndNavigationBarHeight (iPhoneX ? 88.f : 64.f)
#define DEF_SCViewHeight   CGRectGetHeight(ScreenBounds) - 44.0 - 20.0 // 去掉导航条的高度

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//GCD - 一次性执行
#define DEF_kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//GCD - 在Main线程上运行
#define DEF_kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 开启异步线程
#define DEF_kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

//弱引用/强引用
#define DEF_WeakSelf(type)  __weak typeof(type) weak##type = type;
#define DEF_StrongSelf(type)  __strong typeof(type) type = weak##type;

//App版本号
#define DEF_appMPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//AppDelegate对象
#define DEF_AppDelegateInstance [[UIApplication sharedApplication] delegate]

// 字体大小(常规/粗体)
#define DEF_BIGFONTSIZE 17
#define DEF_FONTSIZE 15
#define DEF_MINFONTSIZE 13
#define DEF_BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define DEF_SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define DEF_FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

// 当前版本
#define DEF_FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DEF_DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define DEF_SSystemVersion          ([[UIDevice currentDevice] systemVersion])

//正则验证
#define DEF_ISValidateTel(tel) NSString *regex = @"^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(19[0-9])|(17[0-9])|(18[0-9]))\\d{8}$";\
    NSPredicate *telTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",regex];\
    BOOL ISValidate = [telTest evaluateWithObject:tel];


/**
 *  定义宏 Blocks <便捷方法 为了使用block 的时候 直接提示 block 参数>
 *
 *  @param type     BLOCK 类型
 *  @param variable 要声明的 变量名： 首字母必需小写
 *  @param setters  要声明的 变量名： 与 variable 一致，但首字母必需大写。
 *  ex：
 *      DEF_LL_BLOCKS_VAR(LLListHandlerSectionCountBlock,numberOfSection,NumberOfSection);
 *  usage:
 *      [objectInstace setNumberOfSection(XXXX)];
 */
#ifndef DEF_LL_BLOCKS_VAR
#define DEF_LL_BLOCKS_VAR(type,variable,setters) \
@property(nonatomic,copy,setter=set##setters:)type variable;\
-(void)set##setters:(type)variable;
#endif

/**
 *  BLOCK 不带返回值
 *
 *  @param block        需要判断的Blcok
 *  @param ...          block 的参数
 *
 *  @return
 */
#define DEF_BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };

/**
 *  BLOCK 带返回值
 *
 *  @param block        需要判断的Blcok
 *  @param defaultValue block==nil 之后的 默认值
 *  @param ...          block 的参数
 *
 *  @return
 */
#define DEF_BLOCK_EXEC_RETURN(block, defaultValue, ...) \
if (block) { return block(__VA_ARGS__); } else { return defaultValue; };


// ios 版本判断
#define DEF_SCSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define DEF_iOS9 ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

// 指纹密码是否开启的key
#define DEF_TouchID_Password_Open      @"TouchID_Password_Open"
// 手势密码是否开启的key
#define DEF_Gesture_Password_Open      @"Gesture_Password_Open"
// 记录手势密码GestureCodeKey
#define DEF_Gesture_Code_Key           @"Gesture_Code_Key"
// 手势密码是否显示轨迹的key
#define DEF_Gesture_Password_Show      @"Gesture_Password_Show"





// 手势密码提示Label的高度
#define DEF_LabelHeight 20.0f
// 手势密码九宫格view的宽高
#define DEF_GestureWH   260.0f


/// 手势圆圈正常的颜色
#define DEF_SCCircleNormalColor   [UIColor whiteColor]
/// 手势圆圈选中的颜色
#define DEF_SCCircleSelectedColor [UIColor orangeColor]
/// 手势圆圈错误的颜色
#define DEF_SCCircleErrorColor    [UIColor redColor]


//数据验证
//数据验证
#define DEF_StrValid(f) ((f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])||[f isKindOfClass:[NSNull class]])
#define DEF_SafeStr(f) (DEF_StrValid(f) ? f:@"")
//字符是否为空，为空就用@“”代替，防止程序崩溃
#define DEF_EmptyReplaceString(string,replaceString) DEF_StrValid(f)?string:replaceString
#define DEF_HasString(str,key) ([str rangeOfString:key].location!=NSNotFound)

#define DEF_ValidStr(f) DEF_StrValid(f)
#define DEF_ValidDict(f) (f!=nil && [f isKindOfClass:[NSDictionary class]])
#define DEF_ValidArray(f) (f!=nil && [f isKindOfClass:[NSArray class]] && [f count]>0)
#define DEF_ValidNum(f) (f!=nil && [f isKindOfClass:[NSNumber class]])
#define DEF_ValidClass(f,cls) (f!=nil && [f isKindOfClass:[cls class]])
#define DEF_ValidData(f) (f!=nil && [f isKindOfClass:[NSData class]])

//获取一段时间间隔
#define DEF_kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define DEF_kEndTime  NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)
//打印当前方法名
#define DEF_ITTDPRINTMETHODNAME() ITTDPRINT(@"%s", __PRETTY_FUNCTION__)


//发送通知
#define DEF_KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];

//网络状态变化
#define DEF_KNotificationNetWorkStateChange @"KNotificationNetWorkStateChange"

//单例化一个类
#define DEF_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}


#endif

#ifdef DEBUG
#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define SLog(format, ...)
#endif
