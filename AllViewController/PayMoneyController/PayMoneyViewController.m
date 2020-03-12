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
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, height, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT-height-70)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}



#pragma Uitableview  Delegate
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] init];
        
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
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
    
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
