//
//  ScreenView.h
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/10.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScreenView : UIView

@property (nonatomic, strong) NSArray *itemArray;
@property (nonatomic, strong) NSArray *itemBackColorArray;

//价格Cell View
- (UIView *)getPriceViewWithPrice:(int)newPriceValue
                    oldPriceValue:(int)oldprice
                            image:(NSString *)priceImageName
                            title:(NSString *)titleString
                           height:(int)h;

//适应场景 Cell View
- (UIView *)getScreenView;

//服务动态 Cell View
- (UIView *)getServiceView;

//服务动画View Cell
- (UIView *)getServiceMoveViewWithImage:(NSString *)imgName
                                   name:(NSString *)name
                                content:(NSString *)content
                                   time:(int)time;

//评价View Cell
- (UIView *)getRecommandViewWithTitle:(NSString *)title name:(NSString *)name starImg:(NSString *)imgName content:(NSString *)content;

//服务价钱说明View Cell
- (UIView *)getPriceMsgViewWithImage:(NSString *)imageName title:(NSString *)title titleColor:(NSString *)colorString msg:(NSString *)msg;

//详情服务展示信息方式二 中的顶部View
- (UIView *)getTopViewWithImage:(NSString *)imageName title:(NSString *)title msg:(NSString *)msgString;



@end

NS_ASSUME_NONNULL_END
