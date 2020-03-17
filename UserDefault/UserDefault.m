//
//  UserDefault.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/17.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "UserDefault.h"

@implementation UserDefault

+ (UserDefault *)sharedInstance
{
    static UserDefault *gInstance = NULL;
    
    @synchronized(self)
    {
        if (!gInstance)
            gInstance = [self new];
    }
    
    return(gInstance);
}


- (void)setIsLoginString:(NSString *)isLoginString{
    [[NSUserDefaults standardUserDefaults] setObject:isLoginString forKey:@"isLoginString"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)isLoginString{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"isLoginString"];
}



@end
