//
//  BaseViewController.h
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/9.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
/**
 *  @brief  是否显示返回按钮,默认情况是YES
 */
@property (nonatomic, assign) BOOL isShowLiftBack;

#pragma mark ————— 导航栏 添加全部图片按钮 —————
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

- (void)addNavigationItemWithAskQuestionsNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;


#pragma mark ————— 导航栏 添加筛选图片按钮 —————
- (void)addNavigationItemWithTitleImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

#pragma mark ————— 导航栏 添加文字按钮全部 —————
- (UIButton*)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

#pragma mark ————— 导航栏 添加文字按钮 —————
- (UIButton*)addNavigationItemWithAllTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

#pragma mark ————— 导航栏 添加文字按钮 —————
- (UIButton*)addNavigationItemWithreleaseTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

- (void)addNavigationItemWithTitleNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;


-(void)setNaviLeftItemsWithConfig:(NSArray *)config;
-(void)setNaviRightItemsWithConfig:(NSArray*)config;

#pragma mark ————— 导航栏 搜索 —————
-(UISearchBar*)setNavibarSearchBarWithConfig:(NSDictionary*)config;

-(UISearchBar*)setNavibarSearchBarWithWhiteConfig:(NSDictionary*)config;



@end

NS_ASSUME_NONNULL_END
