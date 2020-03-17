//
//  OrderViewController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/9.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "OrderViewController.h"
#import <Masonry.h>
#import "BMUtilMacro.h"
#import "UIColor+JM.h"
#import "LoginViewController.h"
#import "ChatViewController.h"
#import "UserDefault.h"

@interface OrderViewController ()

@property (nonatomic, retain) UIImageView *unLoginImgview;
@property (nonatomic, retain) UILabel     *unloginMsgLabel;
@property (nonatomic, retain) UIButton    *loginBtn;

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的订单";
    
    //没有登录时显示的界面
    if([[UserDefault sharedInstance].isLoginString isEqualToString:@"false"])
    {
        self.unLoginImgview = [[UIImageView alloc] init];
        [self.view addSubview:self.unLoginImgview];
        [self.unLoginImgview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(100);
            make.centerX.mas_equalTo(self.view.mas_centerX);
            make.centerY.equalTo(self.view.mas_centerY).offset(-50);
        }];
        self.unLoginImgview.image = [UIImage imageNamed:@"unlogin.png"];
        
        self.unloginMsgLabel = [[UILabel alloc] init];
        [self.view addSubview:self.unloginMsgLabel];
        [self.unloginMsgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(DEF_SCREEN_WIDTH);
            make.height.mas_equalTo(50);
            make.centerX.mas_equalTo(self.view.mas_centerX);
            make.top.equalTo(self.unLoginImgview.mas_bottom).offset(20);
        }];
        self.unloginMsgLabel.textAlignment = NSTextAlignmentCenter;
        self.unloginMsgLabel.text = @"尚未登录，请登入后查询订单";
        
        
        self.loginBtn = [[UIButton alloc] init];
        [self.view addSubview:self.loginBtn];
        [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(180);
            make.height.mas_equalTo(45);
            make.centerX.mas_equalTo(self.view.mas_centerX);
            make.top.equalTo(self.unloginMsgLabel.mas_bottom).offset(30);
        }];
        self.loginBtn.layer.cornerRadius = 5.0;
        self.loginBtn.backgroundColor = [UIColor colorWithHexString:@"00CD00"];
        [self.loginBtn setTitle:@"  登录  " forState:UIControlStateNormal];
        [self.loginBtn addTarget:self action:@selector(Login:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contactImg.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showContactController)];
    }
    //登录后的界面
    else
    {
        
    }
}


#pragma mark ------------ 跳转到联系我们界面
- (void)showContactController
{
    ChatViewController *com = [[ChatViewController alloc] init];
    [self.navigationController pushViewController:com animated:YES];
}


#pragma mark --------------- 跳转到登录页面
- (void)Login:(UIButton *)btn
{
    LoginViewController *loginCom = [[LoginViewController alloc] init];
    [self.navigationController presentViewController:loginCom animated:YES completion:nil];
}


@end
