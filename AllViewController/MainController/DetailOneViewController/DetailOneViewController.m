//
//  DetailOneViewController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/10.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "DetailOneViewController.h"
#import "BMUtilMacro.h"
#import <Masonry.h>
#import "UIColor+JM.h"
#import "ScreenView.h"

@interface DetailOneViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic, strong) UIView      *priceView;
@property (nonatomic, strong) UIView      *screenView;
@property (nonatomic, strong) UIView      *serviceView;
@property (nonatomic, strong) UIView      *serviceMoveView_1;
@property (nonatomic, strong) UIView      *serviceMoveView_2;

@end

@implementation DetailOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ScreenView *sview = [[ScreenView alloc] init];
    
    self.priceView = [sview getPriceViewWithPrice:88 oldPriceValue:188 image:@"item8" title:@"恢复微信消息" height:100];
    
    NSArray *titleArray = [[NSArray alloc] initWithObjects:@"无密码查看聊天记录",@"微信数据库损坏修复",@"微信联系人修复",@"微信聊天记录恢复",@"撤回/群聊 消息恢复",@"微信转账记录恢复",@"朋友圈/收藏 恢复",@"微信多开(分身)被封",@"备份微信数据", nil];
    NSArray *colorArray = [[NSArray alloc] initWithObjects:@"FF69B4",@"B4EEB4",@"1E90FF",@"40E0D0",@"FFD700",@"CD2990",@"FF6A6A",@"E9967A",@"EE82EE", nil];
    
    
    sview.itemArray = titleArray;
    sview.itemBackColorArray = colorArray;
    self.screenView = [sview getScreenView];
    
    self.serviceView = [sview getServiceView];
    self.serviceMoveView_1 = [sview getServiceMoveViewWithImage:@"item7" name:@"1号工程师" content:@"完成一次微信数据恢复工作" time:2];
    self.serviceMoveView_2 = [sview getServiceMoveViewWithImage:@"item1" name:@"10号工程师" content:@"完成一次视频恢复工作" time:8];
    
    
    CGFloat height =0;
    if (IS_IPHONE_X) {
        height = AdaptedHeight(82);
    }else
    {
        height = AdaptedHeight(68);
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, height, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT-height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"0xF5F5F5"];
    [self.view addSubview:self.tableView];
    
    
    
    
}


#pragma Uitableview  Delegate
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] init];
        if(indexPath.section == 0)
        {
            if(indexPath.row == 0)
            {
                [cell addSubview:self.priceView];
            }
        }
        if(indexPath.section == 1)
        {
            if(indexPath.row == 0)
            {
                [cell addSubview:self.screenView];
            }
        }
        if(indexPath.section == 2)
        {
            if(indexPath.row == 0)
            {
                [cell addSubview:self.serviceView];
            }
            if(indexPath.row == 1)
            {
                [cell addSubview:self.serviceMoveView_1];
            }
            if(indexPath.row == 2)
            {
                [cell addSubview:self.serviceMoveView_2];
            }
        }
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        if(indexPath.row == 0)
            return self.priceView.frame.size.height;
    }
    if(indexPath.section == 1)
    {
        if(indexPath.row == 0)
            return self.screenView.frame.size.height;
    }
    if(indexPath.section == 2)
    {
        if(indexPath.row == 0)
            return self.serviceView.frame.size.height;
        else if(indexPath.row == 1)
            return self.serviceMoveView_1.frame.size.height;
        else if(indexPath.row == 2)
            return self.serviceMoveView_2.frame.size.height;
    }
    return 80;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 2)
    {
        return 3;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}



@end
