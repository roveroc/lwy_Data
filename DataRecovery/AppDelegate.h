//
//  AppDelegate.h
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/9.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BaseTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabbar;


- (void)saveContext;


@end

