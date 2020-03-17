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
#import "UIColor+JM.h"
#import "BM_NetAPIClicnet.h"
#import "Tools.h"

@interface LoginViewController ()

@property (nonatomic, strong) NSString      *phoneString;
@property (nonatomic, strong) NSString      *codeString;
@property (nonatomic, strong) NSString      *net_codeString;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *cancelBtn = [[UIButton alloc] init];
    [self.view addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(15);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
//    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
//    cancelBtn.backgroundColor = [UIColor colorWithHexString:@"FFB90F"];
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"closeImg.png"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelBtnCliked:) forControlEvents:UIControlEventTouchUpInside];
    
    
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
        make.top.equalTo(logoLab.mas_bottom).offset(50);
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
        make.height.mas_equalTo(40);
    }];
    phoneFiled.tag = 10;
    phoneFiled.placeholder = @"请输入你的手机号";
    
    UIImageView *lineImg = [[UIImageView alloc] init];
    [self.view addSubview:lineImg];
    [lineImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneImg.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH-40);
        make.height.mas_equalTo(0.5);
    }];
    lineImg.backgroundColor = [UIColor colorWithHexString:@"CDC9C9"];
    
    
    UIImageView *codeImg = [[UIImageView alloc] init];
    [self.view addSubview:codeImg];
    [codeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineImg.mas_bottom).offset(15);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(35);
    }];
    codeImg.image = [UIImage imageNamed:@"item1"];
    
    UITextField *codeFiled = [[UITextField alloc] init];
    [self.view addSubview:codeFiled];
    [codeFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(codeImg.mas_centerY);
        make.left.equalTo(codeImg.mas_right).offset(15);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH - 100);
        make.height.mas_equalTo(40);
    }];
    codeFiled.tag = 11;
    codeFiled.placeholder = @"请输入验证码";
    
    UIButton *codebtn = [[UIButton alloc] init];
    [self.view addSubview:codebtn];
    [codebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(codeImg.mas_centerY);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.width.mas_equalTo(85);
        make.height.mas_equalTo(35);
    }];
    [codebtn setTitle:@"验证码" forState:UIControlStateNormal];
    codebtn.layer.cornerRadius = 8.0;
    codebtn.titleLabel.font = [UIFont systemFontOfSize:15];
    codebtn.backgroundColor = [UIColor colorWithHexString:@"32CD32"];
    [codebtn addTarget:self action:@selector(codeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *codeLineImg = [[UIImageView alloc] init];
    [self.view addSubview:codeLineImg];
    [codeLineImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(codeImg.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH-40);
        make.height.mas_equalTo(0.7);
    }];
    codeLineImg.backgroundColor = [UIColor colorWithHexString:@"CDC9C9"];
    
    
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(codeLineImg.mas_bottom).offset(88);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH - 80);
        make.height.mas_equalTo(50);
    }];
    loginBtn.layer.cornerRadius = 8.0;
    [loginBtn setTitle:@"登  入" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    loginBtn.backgroundColor = [UIColor colorWithHexString:@"32CD32"];
    [loginBtn addTarget:self action:@selector(loginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark -------- 退出登入界面
- (void)cancelBtnCliked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -------- 获取验证码
- (void)codeBtnClicked:(id)sender
{
    NSString *path = [DEF_NETPATH_BASEURL stringByAppendingString:@"api/account/sendCode"];
    NSDictionary * params = @{@"phone":@"13502810641"};

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    manager.requestSerializer  = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];

    [manager POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {

    }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        
        if([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"responseObject = %@",responseJSON);
        }
    }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"error = %@",error);
    }];
}


#pragma mark -------- 登入
- (void)loginBtnClicked:(id)sender
{
    if([Tools isValidateTel:self.phoneString])
    {
        
    }
    else{
        [Tools showMessage:@"请输入正确的验证码"];
    }
}


-(void)textFieldDidEndEditing:(UITextField *)textField
{
 
    if (textField.tag == 10)
    {
        self.phoneString = textField.text;
    }
    else if (textField.tag == 11)
    {
        self.codeString = textField.text;
    }
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([textField.text isEqualToString:@"请输入你的手机号"]) {
        self.phoneString = @"";
    }
    if ([textField.text isEqualToString:@"请输入验证码"]) {
        self.codeString = @"";
    }
    return YES;
}


@end
