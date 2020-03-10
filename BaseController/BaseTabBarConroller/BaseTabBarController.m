//
//  BaseTabBarController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/9.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BMUtilMacro.h"

@interface BaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;

    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.tintColor = [UIColor whiteColor];

    // ios12.1 iPhoneX tabbarItem 在pop时候跳动问题
    [[UITabBar appearance] setTranslucent:NO];
    self.extendedLayoutIncludesOpaqueBars = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//1、视图将要切换时调用，viewController为将要显示的控制器，如果返回的值为NO，则无法点击其它分栏了（viewController指代将要显示的控制器）
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    

    
    return YES;
    
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"%ld",tabBarController.selectedIndex);
    
}




@end
