//
//  UserDefault.h
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/17.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDefault : NSObject

+ (UserDefault *)sharedInstance;

@property (nonatomic, retain) NSString *isLoginString;

@end

NS_ASSUME_NONNULL_END
