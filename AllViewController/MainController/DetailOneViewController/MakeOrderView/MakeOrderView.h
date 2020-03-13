//
//  MakeOrderView.h
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/12.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MakeOrderViewDelegate <NSObject>

- (void)orderRowSelected:(int)row price:(NSString *)pv content:(NSString *)msg;

@end

@interface MakeOrderView : UIView <MakeOrderViewDelegate>

@property (nonatomic, strong) id<MakeOrderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
