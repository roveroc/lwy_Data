//
//  AppDelegate.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/9.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+JM.h"
#import "MainViewController.h"
#import "GroupViewController.h"
#import "NewsViewController.h"
#import "OrderViewController.h"
#import "BaseViewController.h"
#import "BaseTabBarController.h"
#import "BaseNavigationController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UIButton appearance] setExclusiveTouch:YES];
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MainViewController  *mainCom    = [[MainViewController  alloc] init];
    GroupViewController *groupCom   = [[GroupViewController alloc] init];
    NewsViewController  *newsCom    = [[NewsViewController  alloc] init];
    OrderViewController *orderCom   = [[OrderViewController alloc] init];
    
    BaseNavigationController *mainNav  = [self addChildViewController:mainCom
                                                                title:@"首页"
                                                           imageNamed:@"main_disselected"
                                                        selectedImage:@"main_selected"];
    
    BaseNavigationController *groupNav = [self addChildViewController:groupCom
                                                                title:@"团队"
                                                            imageNamed:@"group_disselected"
                                                        selectedImage:@"group_selected"];
    
    BaseNavigationController *newsNav  = [self addChildViewController:newsCom
                                                                title:@"动态"
                                                           imageNamed:@"news_disselected"
                                                        selectedImage:@"news_selected"];
    
    BaseNavigationController *orderNav = [self addChildViewController:orderCom
                                                                title:@"订单"
                                                           imageNamed:@"order_disselected"
                                                        selectedImage:@"order_selected"];
    
    NSArray *navArray = [[NSArray alloc] initWithObjects:mainNav,groupNav,newsNav,orderNav, nil];
    
    self.tabbar = [[UITabBarController alloc] init];
    [self.tabbar setViewControllers:navArray];
    
    self.window.rootViewController = self.tabbar;
        
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (BaseNavigationController *)addChildViewController:(UIViewController *)vc title:(NSString *)title imageNamed:(NSString *)imageNamed selectedImage:(NSString *)selImage
{
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    // 如果同时有navigationbar 和 tabbar的时候最好分别设置它们的title
    vc.navigationItem.title = title;
    nav.tabBarItem.title = title;
    
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:@"1E90FF"]} forState:UIControlStateSelected];
  
    [nav.tabBarItem setImage:[[UIImage imageNamed:imageNamed] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [nav.tabBarItem setSelectedImage:[[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    return nav;
}



#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"DataRecovery"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
