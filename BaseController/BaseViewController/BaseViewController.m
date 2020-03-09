//
//  BaseViewController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/9.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "BaseViewController.h"
#import "BMUtilMacro.h"
#import "UIColor+JM.h"

@interface BaseViewController ()
{
    UIImageView *navBarHairlineImageView;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.isShowLiftBack = YES;

}

-(UIImageView *)slnFindHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0){
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self slnFindHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    navBarHairlineImageView.hidden = NO;
    //键盘回退
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}



/**
 *  @brief  是否显示返回按钮
 */
- (void) setIsShowLiftBack:(BOOL)isShowLiftBack
{
    _isShowLiftBack = isShowLiftBack;
    NSInteger VCCount = self.navigationController.viewControllers.count;
    //下面判断的意义是 当VC所在的导航控制器中的VC个数大于1 或者 是present出来的VC时，才展示返回按钮，其他情况不展示
    if (isShowLiftBack && ( VCCount > 1 || self.navigationController.presentingViewController != nil)) {
        [self addNavigationItemWithImageNames:@[@"nav_icon_back"] isLeft:YES target:self action:@selector(backBtnClicked) tags:nil];
        
    } else {
        self.navigationItem.hidesBackButton = YES;
        UIBarButtonItem * NULLBar=[[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
        self.navigationItem.leftBarButtonItem = NULLBar;
    }
}

- (void)backBtnClicked{
    
    
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark ————— 导航栏 添加提问图片按钮 —————
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    NSMutableArray * items = [[NSMutableArray alloc] init];
    NSInteger i = 0;
    for (NSString * imageName in imageNames) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 30, 30);
        
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        if (isLeft) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
            [btn setTitle:@"" forState:UIControlStateNormal];
        }else{
         
            
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
                                                     btn.imageView.frame.size.width, 0, btn.imageView.frame.size.width)];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width+30, btn.titleLabel.frame.size.width, - btn.titleLabel.bounds.size.width)];
            
            [btn setTitle:@"提问" forState:UIControlStateNormal];
        }
        
        btn.tag = [tags[i++] integerValue];
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

- (void)addNavigationItemWithAskQuestionsNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    NSMutableArray * items = [[NSMutableArray alloc] init];
    NSInteger i = 0;
    for (NSString * imageName in imageNames) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 30, 30);
        
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        if (isLeft) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
            [btn setTitle:@"" forState:UIControlStateNormal];
        }else{
            
            
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
                                                     btn.imageView.frame.size.width, 0, btn.imageView.frame.size.width)];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width+30, btn.titleLabel.frame.size.width, - btn.titleLabel.bounds.size.width)];
            
            [btn setTitle:@"完成" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithHexString:@"#01B1A5"] forState:UIControlStateNormal];
        }
        
        btn.tag = [tags[i++] integerValue];
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

- (void)addNavigationItemWithTitleNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    NSMutableArray * items = [[NSMutableArray alloc] init];
    NSInteger i = 0;
    for (NSString * imageName in imageNames) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 30, 30);
        
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn setTitleColor:[UIColor colorWithHexString:@"#02B4A8"] forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        if (isLeft) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
            [btn setTitle:[imageNames firstObject] forState:UIControlStateNormal];
        }else{
            
            
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
                                                     btn.imageView.frame.size.width, 0, btn.imageView.frame.size.width)];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width+30, btn.titleLabel.frame.size.width, - btn.titleLabel.bounds.size.width)];
            
            [btn setTitle:[imageNames firstObject] forState:UIControlStateNormal];
        }
        
        btn.tag = [tags[i++] integerValue];
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
    
}
#pragma mark ————— 导航栏 添加筛选图片按钮 —————
- (void)addNavigationItemWithTitleImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    NSMutableArray * items = [[NSMutableArray alloc] init];
    NSInteger i = 0;
    for (NSString * imageName in imageNames) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 30, 30);
        
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        if (isLeft) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
            [btn setTitle:@"" forState:UIControlStateNormal];
        }else{
            
            
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
                                                     btn.imageView.frame.size.width, 0, btn.imageView.frame.size.width)];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width+30, btn.titleLabel.frame.size.width, - btn.titleLabel.bounds.size.width)];
            
            [btn setTitle:@"筛选" forState:UIControlStateNormal];
        }
        
        btn.tag = [tags[i++] integerValue];
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}
#pragma mark ————— 导航栏 添加文字按钮 —————
- (UIButton*)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
   
    NSMutableArray * items = [[NSMutableArray alloc] init];
    NSMutableArray * buttonArray = [NSMutableArray array];
    NSInteger i = 0;
    UIButton * button ;
    for (NSString * title in titles) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, AdaptedWidth(30), AdaptedWidth(30));
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = DEF_SYSTEMFONT(18);
        [btn setImage:[UIImage imageNamed:@"xiangxia"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = [tags[i++] integerValue];
        [btn sizeToFit];
        button = btn;
        
        //设置偏移
        
        if (isLeft) {
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
                                                      btn.imageView.frame.size.width , 0,  btn.imageView.frame.size.width )];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0,  btn.titleLabel.frame.size.width , 0, -  btn.titleLabel.frame.size.width)];
        }else{
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        }
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        [buttonArray addObject:btn];
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
    
    return button;
}
- (UIButton*)addNavigationItemWithAllTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    NSMutableArray * items = [[NSMutableArray alloc] init];
    NSMutableArray * buttonArray = [NSMutableArray array];
    NSInteger i = 0;
    UIButton * button ;
    for (NSString * title in titles) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = DEF_SYSTEMFONT(18);
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#5C5C5C"] forState:UIControlStateNormal];
        btn.tag = [tags[i++] integerValue];
        [btn sizeToFit];
        
        button = btn;
        //设置偏移
        if (isLeft) {
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
                                                     btn.imageView.frame.size.width, 0, btn.imageView.frame.size.width)];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width, 0, - btn.titleLabel.bounds.size.width)];
        }else{
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        }
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        [buttonArray addObject:btn];
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
    
    return button;
}
- (UIButton*)addNavigationItemWithreleaseTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags
{
    NSMutableArray * items = [[NSMutableArray alloc] init];
    NSMutableArray * buttonArray = [NSMutableArray array];
    NSInteger i = 0;
    UIButton * button ;
    for (NSString * title in titles) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = DEF_SYSTEMFONT(18);
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#109A98"] forState:UIControlStateNormal];
        btn.tag = [tags[i++] integerValue];
        [btn sizeToFit];
        
        button = btn;
        //设置偏移
        if (isLeft) {
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
                                                     btn.imageView.frame.size.width, 0, btn.imageView.frame.size.width)];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width, 0, - btn.titleLabel.bounds.size.width)];
        }else{
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        }
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        [buttonArray addObject:btn];
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
    
    return button;
}
-(void)setNaviLeftItemsWithConfig:(NSArray *)config
{
    NSArray*items = [self itemsWithConfig:config];
    
    if (items.count) {
        self.navigationItem.leftBarButtonItems=items;
    }
    
}
-(NSArray*)itemsWithConfig:(NSArray*)config{
    NSMutableArray *array = [NSMutableArray new];
    for (NSDictionary*cc in config) {
        
        id content = cc[@"content"];
        id type = cc[@"type"];
        id action = cc[@"action"];
        SEL s = NSSelectorFromString(action);
        UIBarButtonItem*btn;
        if ([type isEqualToString:@"img"]) {
            
            btn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:content] style:UIBarButtonItemStylePlain target:self action:s];
            
        }
        if ([type isEqualToString:@"text"]) {
            
            btn=[[UIBarButtonItem alloc]initWithTitle:content style:UIBarButtonItemStylePlain target:self action:s];
            [btn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                               forState:UIControlStateNormal];
            
        }
        if ([type isEqualToString:@"view"]) {
            
            btn=[[UIBarButtonItem alloc] initWithCustomView: content];
            
        }
        if (btn) {
            [array addObject:btn];
        }
        
    }
    return array;
}
-(void)setNaviRightItemsWithConfig:(NSArray *)config
{
    NSArray*items = [self itemsWithConfig:config];
    
    if (items.count) {
        self.navigationItem.rightBarButtonItems=items;
    }
}

-(UISearchBar*)setNavibarSearchBarWithConfig:(NSDictionary*)config{
    
    UISearchBar *mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(AdaptedWidth(10), 0, DEF_SCREEN_WIDTH-AdaptedWidth(20), 44) ];
//    mySearchBar.layer.masksToBounds = YES;
//
//    mySearchBar.layer.cornerRadius = 22;
   // mySearchBar.barTintColor    = BM_NAVI_COLOR;
   // mySearchBar.tintColor       = BM_NAVI_COLOR;
    mySearchBar.placeholder     = config[@"placeholder"];
    
   // mySearchBar.backgroundColor =  DEF_ClearColor;
    mySearchBar.text = @"";
    UIImage *img = [UIImage imageNamed:config[@"bg_img"]];
    UIImage *imgSearchIcon = [UIImage imageNamed:config[@"img_search_icon"]];
    
    [mySearchBar setSearchFieldBackgroundImage:img forState:UIControlStateNormal ];
    [mySearchBar setImage:imgSearchIcon forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    mySearchBar.translucent = YES;
  //  mySearchBar.delegate = self;
    
    // Get the instance of the UITextField of the search bar
    UITextField *searchField = [mySearchBar valueForKey:@"_searchField"];
    // Change search bar text color
    searchField.textColor = config[@"text_color"];
    // Change the search bar placeholder text color
    [searchField setValue:  [UIColor lightGrayColor]
               forKeyPath:@"_placeholderLabel.textColor"];
    //chanage the seach bar placeholder text font
     [searchField setValue:[UIFont boldSystemFontOfSize:11] forKeyPath:@"_placeholderLabel.font"];
    
    float version = [[[ UIDevice currentDevice ] systemVersion ] floatValue ];
    
    if ([ mySearchBar respondsToSelector : @selector (barTintColor)]) {
        
        float  iosversion7_1 = version ;
        
        if (version >= iosversion7_1)
            
        {
            
            //iOS7.1
            
            [[[[ mySearchBar . subviews objectAtIndex : 0 ] subviews ] objectAtIndex : 0 ] removeFromSuperview ];
            
            [ mySearchBar setBackgroundColor :[ UIColor clearColor]];
            
        }
        
        else
            
        {
            
            //iOS7.0
            
            [ mySearchBar setBarTintColor :[ UIColor clearColor ]];
            
            [ mySearchBar setBackgroundColor :[ UIColor clearColor ]];
            
        }
        
    }
    
    else
        
    {
        
        //iOS7.0 以下
        
        [[ mySearchBar . subviews objectAtIndex : 0 ] removeFromSuperview ];
        
        [ mySearchBar setBackgroundColor :[ UIColor clearColor ]];
        
    }
    
    self.navigationItem.titleView = mySearchBar;
    return mySearchBar;
}

 -(UISearchBar*)setNavibarSearchBarWithWhiteConfig:(NSDictionary*)config
{
    UISearchBar *mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(AdaptedWidth(10), 0, DEF_SCREEN_WIDTH-AdaptedWidth(20), 44) ];
    //    mySearchBar.layer.masksToBounds = YES;
    //
    //    mySearchBar.layer.cornerRadius = 22;
    // mySearchBar.barTintColor    = BM_NAVI_COLOR;
    // mySearchBar.tintColor       = BM_NAVI_COLOR;
    mySearchBar.placeholder     = config[@"placeholder"];
    
    // mySearchBar.backgroundColor =  DEF_ClearColor;
    mySearchBar.text = @"";
    UIImage *img = [UIImage imageNamed:config[@"bg_img"]];
    UIImage *imgSearchIcon = [UIImage imageNamed:config[@"img_search_icon"]];
    
    [mySearchBar setSearchFieldBackgroundImage:img forState:UIControlStateNormal ];
    [mySearchBar setImage:imgSearchIcon forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    mySearchBar.translucent = YES;
    //  mySearchBar.delegate = self;
    
    // Get the instance of the UITextField of the search bar
    UITextField *searchField = [mySearchBar valueForKey:@"_searchField"];
    // Change search bar text color
    searchField.textColor = config[@"text_color"];
    // Change the search bar placeholder text color
    [searchField setValue:  [UIColor lightGrayColor]
               forKeyPath:@"_placeholderLabel.textColor"];
    //chanage the seach bar placeholder text font
    [searchField setValue:[UIFont boldSystemFontOfSize:11] forKeyPath:@"_placeholderLabel.font"];
    
    float version = [[[ UIDevice currentDevice ] systemVersion ] floatValue ];
    
    if ([ mySearchBar respondsToSelector : @selector (barTintColor)]) {
        
        float  iosversion7_1 = version ;
        
        if (version >= iosversion7_1)
            
        {
            
            //iOS7.1
            
            [[[[ mySearchBar . subviews objectAtIndex : 0 ] subviews ] objectAtIndex : 0 ] removeFromSuperview ];
            
            [ mySearchBar setBackgroundColor :[ UIColor clearColor]];
            
        }
        
        else
            
        {
            
            //iOS7.0
            
            [ mySearchBar setBarTintColor :[ UIColor clearColor ]];
            
            [ mySearchBar setBackgroundColor :[ UIColor clearColor ]];
            
        }
        
    }
    
    else
        
    {
        
        //iOS7.0 以下
        
        [[ mySearchBar . subviews objectAtIndex : 0 ] removeFromSuperview ];
        
        [ mySearchBar setBackgroundColor :[ UIColor clearColor ]];
        
    }
    
    self.navigationItem.titleView = mySearchBar;
    return mySearchBar;
}



- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -  屏幕旋转
/**
 *  @brief  在需要旋转的页面重写以下三个方法 默认不可旋转
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

/**
 *  @brief  是否支持旋转
 */
- (BOOL)shouldAutorotate{
    return NO;
}

/**
 *  @brief  默认进去类型
 */
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return   UIInterfaceOrientationPortrait;
}



@end
