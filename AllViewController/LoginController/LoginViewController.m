//
//  LoginViewController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/13.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "LoginViewController.h"
#import <Masonry.h>
#import "BMUtilMacro.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *logoImg = [[UIImageView alloc] init];
    [self.view addSubview:logoImg];
    [logoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    logoImg.image = [UIImage imageNamed:@"item1"];
    
    UILabel *logoLab = [[UILabel alloc] init];
    [self.view addSubview:logoLab];
    [logoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logoImg.mas_bottom).offset(30);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH);
        make.height.mas_equalTo(120);
    }];
    logoLab.textAlignment = NSTextAlignmentCenter;
    logoLab.font = [UIFont systemFontOfSize:38];
    logoLab.text = @"老五游数据恢复";
    
    
    UIImageView *phoneImg = [[UIImageView alloc] init];
    [self.view addSubview:phoneImg];
    [phoneImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logoLab.mas_bottom).offset(70);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(35);
    }];
    phoneImg.image = [UIImage imageNamed:@"item1"];
    
    UITextField *phoneFiled = [[UITextField alloc] init];
    [self.view addSubview:phoneFiled];
    [phoneFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(phoneImg.mas_centerY);
        make.left.equalTo(phoneImg.mas_right).offset(15);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH - 80);
        make.height.mas_equalTo(60);
    }];
//    phoneFiled.backgroundColor = [UIColor orangeColor];
    phoneFiled.placeholder = @"请输入你的手机号";
    
    UIImageView *lineImg = [[UIImageView alloc] init];
    [self.view addSubview:lineImg];
    [lineImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneImg.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH);
        make.height.mas_equalTo(1);
    }];
    lineImg.backgroundColor = [UIColor lightGrayColor];
    
}



@end
