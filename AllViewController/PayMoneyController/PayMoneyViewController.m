//
//  PayMoneyViewController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/12.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "PayMoneyViewController.h"
#import <Masonry.h>
#import "BMUtilMacro.h"
#import "UIColor+JM.h"

@interface PayMoneyViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PayMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"订单支付";
    
    CGFloat height =0;
    if (IS_IPHONE_X) {
        height = AdaptedHeight(72);
    }else
    {
        height = AdaptedHeight(68);
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, height, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT-height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

#pragma mark ------------ 获取手机验证码
- (void)getCodeFunction:(id)sender
{
    
}

#pragma mark ------------ 微信支付
- (void)wechatPayFunction:(id)sender
{
    
}


#pragma mark ------------ 支付宝支付
- (void)aliPayFunction:(id)sender
{
    
}


#pragma Uitableview  Delegate
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] init];
        cell.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
        if(indexPath.row == 0)
        {
            cell.backgroundColor = [UIColor colorWithHexString:@"FFFFFF"];
            UILabel *lab1 = [[UILabel alloc] init];
            [cell addSubview:lab1];
            [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.mas_top).offset(10);
                make.left.equalTo(cell.mas_left).offset(15);
                make.width.mas_equalTo(80);
                make.height.mas_equalTo(25);
            }];
            lab1.textColor = [UIColor lightGrayColor];
            lab1.textAlignment = NSTextAlignmentLeft;
            lab1.font = [UIFont systemFontOfSize:12];
            lab1.text = @"订单内容";
            
            UILabel *lab2 = [[UILabel alloc] init];
            [cell addSubview:lab2];
            [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lab1.mas_bottom).offset(10);
                make.left.equalTo(cell.mas_left).offset(15);
                make.width.mas_equalTo(180);
                make.height.mas_equalTo(25);
            }];
            lab2.textColor = [UIColor darkGrayColor];
            lab2.textAlignment = NSTextAlignmentLeft;
            lab2.font = [UIFont systemFontOfSize:15];
            lab2.text = @"夜间加急 - 专家通宵服务";
            
            UILabel *lab3 = [[UILabel alloc] init];
            [cell addSubview:lab3];
            [lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lab2.mas_top).offset(0);
                make.right.equalTo(cell.mas_right).offset(-15);
                make.width.mas_equalTo(180);
                make.height.mas_equalTo(25);
            }];
            lab3.textColor = [UIColor redColor];
            lab3.textAlignment = NSTextAlignmentRight;
            lab3.font = [UIFont systemFontOfSize:15];
            lab3.text = @"￥888";
        }
        else if(indexPath.row == 1)
        {
            cell.backgroundColor = [UIColor colorWithHexString:@"FFFFFF"];
            UILabel *lab1 = [[UILabel alloc] init];
            [cell addSubview:lab1];
            [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.mas_top).offset(10);
                make.left.equalTo(cell.mas_left).offset(15);
                make.width.mas_equalTo(280);
                make.height.mas_equalTo(25);
            }];
            lab1.textColor = [UIColor lightGrayColor];
            lab1.textAlignment = NSTextAlignmentLeft;
            lab1.font = [UIFont systemFontOfSize:12];
            lab1.text = @"联系方式 (以便工程师联系您)";
            
            UIImageView *imgv = [[UIImageView alloc] init];
            [cell addSubview:imgv];
            [imgv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lab1.mas_bottom).offset(10);
                make.left.equalTo(cell.mas_left).offset(15);
                make.width.mas_equalTo(25);
                make.height.mas_equalTo(25);
            }];
            imgv.image = [UIImage imageNamed:@"item1"];
            
            UILabel *lab2 = [[UILabel alloc] init];
            [cell addSubview:lab2];
            [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lab1.mas_bottom).offset(10);
                make.left.equalTo(imgv.mas_right).offset(10);
                make.width.mas_equalTo(50);
                make.height.mas_equalTo(25);
            }];
            lab2.textColor = [UIColor darkGrayColor];
            lab2.textAlignment = NSTextAlignmentLeft;
            lab2.font = [UIFont systemFontOfSize:15];
            lab2.text = @"手机号";
            
            imgv.center = CGPointMake(imgv.center.x, lab2.center.y);
            
            UITextField *field = [[UITextField alloc] init];
            [cell addSubview:field];
            [field mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lab2.mas_top).offset(0);
                make.left.equalTo(lab2.mas_right).offset(10);
                make.right.equalTo(cell.mas_right);
                make.height.mas_equalTo(25);
            }];
            field.textAlignment = NSTextAlignmentLeft;
            field.font = [UIFont systemFontOfSize:15];
            field.placeholder = @"请输入手机号";
            
            field.center = CGPointMake(field.center.x, lab2.center.y);
        }
        else if(indexPath.row == 2)
        {
            cell.backgroundColor = [UIColor colorWithHexString:@"FFFFFF"];
            UIImageView *imgv = [[UIImageView alloc] init];
            [cell addSubview:imgv];
            [imgv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.mas_top).offset(12);
                make.left.equalTo(cell.mas_left).offset(15);
                make.width.mas_equalTo(25);
                make.height.mas_equalTo(25);
            }];
            imgv.image = [UIImage imageNamed:@"item1"];
            
            UILabel *lab2 = [[UILabel alloc] init];
            [cell addSubview:lab2];
            [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.mas_top).offset(13);
                make.left.equalTo(imgv.mas_right).offset(10);
                make.width.mas_equalTo(50);
                make.height.mas_equalTo(30);
            }];
            lab2.textColor = [UIColor darkGrayColor];
            lab2.textAlignment = NSTextAlignmentLeft;
            lab2.font = [UIFont systemFontOfSize:15];
            lab2.text = @"验证码";
            
            imgv.center = CGPointMake(imgv.center.x, lab2.center.y);
            
            UITextField *field = [[UITextField alloc] init];
            [cell addSubview:field];
            [field mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lab2.mas_top).offset(0);
                make.left.equalTo(lab2.mas_right).offset(10);
                make.right.equalTo(cell.mas_right);
                make.height.mas_equalTo(25);
            }];
            field.textAlignment = NSTextAlignmentLeft;
            field.font = [UIFont systemFontOfSize:15];
            field.placeholder = @"请输入手机验证码";
            
            field.center = CGPointMake(field.center.x, lab2.center.y);
            
            UIButton *getCodeBtn = [[UIButton alloc] init];
            [cell addSubview:getCodeBtn];
            [getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.mas_top).offset(10);
                make.right.equalTo(cell.mas_right).offset(-15);
                make.height.mas_equalTo(30);
                make.width.mas_equalTo(90);
            }];
            [getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            getCodeBtn.backgroundColor = [UIColor colorWithHexString:@"1E90FF"];
            getCodeBtn.layer.cornerRadius = 3.;
            getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
            [getCodeBtn addTarget:self action:@selector(getCodeFunction:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        else if(indexPath.row == 5)
        {
            UIButton *wechatPayBtn = [[UIButton alloc] init];
            [cell addSubview:wechatPayBtn];
            [wechatPayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.mas_top).offset(15);
                make.left.equalTo(cell.mas_left).offset(15);
                make.right.equalTo(cell.mas_right).offset(-15);
                make.height.mas_equalTo(50);
            }];
            [wechatPayBtn setTitle:@"微信支付           ￥188" forState:UIControlStateNormal];
            wechatPayBtn.backgroundColor = [UIColor colorWithHexString:@"00CD00"];
            wechatPayBtn.layer.cornerRadius = 20.;
            wechatPayBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            [wechatPayBtn addTarget:self action:@selector(wechatPayFunction:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        else if(indexPath.row == 6)
        {
            UIButton *aliPayBtn = [[UIButton alloc] init];
            [cell addSubview:aliPayBtn];
            [aliPayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.mas_top).offset(15);
                make.left.equalTo(cell.mas_left).offset(15);
                make.right.equalTo(cell.mas_right).offset(-15);
                make.height.mas_equalTo(50);
            }];
            [aliPayBtn setTitle:@"支付宝支付           ￥188" forState:UIControlStateNormal];
            aliPayBtn.backgroundColor = [UIColor colorWithHexString:@"6495ED"];
            aliPayBtn.layer.cornerRadius = 20.;
            aliPayBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            [aliPayBtn addTarget:self action:@selector(aliPayFunction:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if(indexPath.row == 7)
        {
            UILabel *lab = [[UILabel alloc] init];
            [cell addSubview:lab];
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.mas_top).offset(20);
                make.centerX.equalTo(cell.mas_centerX);
                make.width.mas_equalTo(cell.frame.size.width);
                make.height.mas_equalTo(40);
            }];
            lab.textColor = [UIColor redColor];
            lab.textAlignment = NSTextAlignmentCenter;
            lab.font = [UIFont systemFontOfSize:14];
            lab.text = @"再不寻求帮助，数据可能永远丢失！！！";
        }
    }
    
    //设置点击是透明色
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor clearColor];
    bgColorView.layer.masksToBounds = YES;
    cell.selectedBackgroundView = bgColorView;
    
    
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 2)
        return 50;
    return 80;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}




@end
