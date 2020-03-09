//
//  BaseNavigationController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/9.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
 
//    //去掉导航栏最下边线颜色
    UIImage *img = [UIImage imageNamed:@""];
    [self.navigationController.navigationBar setBackgroundImage:img  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationBar setShadowImage:[UIImage new]];//导航栏最下边线颜色
   
}

//重写这个方法，在跳转后自动隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self.viewControllers count] > 0){
        viewController.hidesBottomBarWhenPushed = YES;

    }
     [super pushViewController:viewController animated:animated];
    // 修正push控制器tabbar上移问题
    
    if (@available(iOS 11.0, *)){
        
        // 修改tabBra的frame
        
        CGRect frame = self.tabBarController.tabBar.frame;
        
        frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
        
        self.tabBarController.tabBar.frame = frame;
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
