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
#import "CommentModel.h"

@interface DetailOneViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) ScreenView        *sview;

@property (nonatomic, strong) UIView            *priceView;
@property (nonatomic, strong) UIView            *screenView;
@property (nonatomic, strong) UIView            *serviceView;
@property (nonatomic, strong) UIView            *serviceMoveView_1;
@property (nonatomic, strong) UIView            *serviceMoveView_2;

@property (nonatomic, strong) NSArray           *problemArray;
@property (nonatomic, strong) NSArray           *subProblemArray;
@property (nonatomic, strong) NSMutableArray    *expandArray;

@property (nonatomic, strong) NSMutableArray    *commentArray;

@end

@implementation DetailOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"服务详情";
    
    self.sview = [[ScreenView alloc] init];
    
    self.priceView = [self.sview getPriceViewWithPrice:88 oldPriceValue:188 image:@"item8" title:@"恢复微信消息" height:100];
    
    NSArray *titleArray = [[NSArray alloc] initWithObjects:@"无密码查看聊天记录",@"微信数据库损坏修复",@"微信联系人修复",@"微信聊天记录恢复",@"撤回/群聊 消息恢复",@"微信转账记录恢复",@"朋友圈/收藏 恢复",@"微信多开(分身)被封",@"备份微信数据", nil];
    NSArray *colorArray = [[NSArray alloc] initWithObjects:@"FF69B4",@"B4EEB4",@"1E90FF",@"40E0D0",@"FFD700",@"CD2990",@"FF6A6A",@"E9967A",@"EE82EE", nil];
    
    
    self.sview.itemArray = titleArray;
    self.sview.itemBackColorArray = colorArray;
    self.screenView = [self.sview getScreenView];
    
    self.serviceView = [self.sview getServiceView];
    self.serviceMoveView_1 = [self.sview getServiceMoveViewWithImage:@"item7" name:@"1号工程师" content:@"完成一次微信数据恢复工作" time:2];
    self.serviceMoveView_2 = [self.sview getServiceMoveViewWithImage:@"item1" name:@"10号工程师" content:@"完成一次视频恢复工作" time:8];
    
    
    self.problemArray = [[NSArray alloc] initWithObjects:@"我可以恢复亲友的微信吗",
                                                         @"聊天记录里面的图片和视频能恢复吗",
                                                         @"数据丢失多长时间可以恢复",
                                                         @"恢复数据大概需要多长时间",
                                                         @"工程师帮我分析数据安全吗",nil];
    self.subProblemArray = [[NSArray alloc] initWithObjects:@"------我可以恢复亲友的微信吗------",
                                                            @"------聊天记录里面的图片和视频能恢复吗------,------聊天记录里面的图片和视频能恢复吗------------聊天记录里面的图片和视频能恢复吗------",
                                                            @"------数据丢失多长时间可以恢复-------",
                                                            @"------恢复数据大概需要多长时间-------",
                                                            @"------工程师帮我分析数据安全吗-------",nil];
    self.expandArray = [[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",@"0",@"0",nil];
    
    
    self.commentArray = [[NSMutableArray alloc] init];
    for(int i=0;i<5;i++)
    {
        CommentModel *m = [[CommentModel alloc] init];
        m.title = [NSString stringWithFormat:@"王五_%d",i+1];
        m.name  = [NSString stringWithFormat:@"Name-大大--%d",i+1];
        m.imgName = @"starImg";
        if(i /2 == 0)
            m.commnetString = [NSString stringWithFormat:@" 我可以恢复亲友的微信--我可以恢复亲友的微信==我可以恢复亲友的微信==我可以恢复亲友的微信==我可以恢复亲友的微信==我可以恢复亲%d",(i+1)*(i+2)];
        else
            m.commnetString = [NSString stringWithFormat:@"北京西游国际旅行社--北京西游国际旅行社--北京西游国际旅行社--北京西游国际旅行社--北京西游国际旅行社--北京西游国际旅行社--北京西游国际旅行社--北京西游国际旅行社"];
        [self.commentArray addObject:m];
    }

    
    
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
    if(indexPath.section == 3)
    {
        if(indexPath.row == 0){
            cell.textLabel.text = @"常见问题";
        }
        else{
            for(UIView *v in cell.subviews)
            {
                if([v isKindOfClass:[UIImageView class]] || [v isKindOfClass:[UILabel class]])
                {
                    [v removeFromSuperview];
                }
            }
            if([[self.expandArray objectAtIndex:indexPath.row-1] intValue] == 0)
            {
                UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 15, 15)];
                img.image = [UIImage imageNamed:@"item1"];
                [cell addSubview:img];
                
                UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(35, 5, DEF_SCREEN_WIDTH-50, 30)];
                lab.text = [self.problemArray objectAtIndex:indexPath.row-1];
                lab.textAlignment = NSTextAlignmentLeft;
                lab.font = [UIFont systemFontOfSize:15];
                [cell addSubview:lab];
                
                UIImageView *arrowImg = [[UIImageView alloc] init];
                [cell addSubview:arrowImg];
                [arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(lab.mas_top).offset(5);
                    make.right.equalTo(lab.mas_right).offset(-5);
                    make.width.mas_equalTo(20);
                    make.width.mas_equalTo(20);
                }];
                arrowImg.image = [UIImage imageNamed:@"arrowimg_1"];
                
            }
            else if([[self.expandArray objectAtIndex:indexPath.row-1] intValue] == 1)
            {
                UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 15, 15)];
                img.image = [UIImage imageNamed:@"item1"];
                [cell addSubview:img];
                
                UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(35, 5, DEF_SCREEN_WIDTH-50, 30)];
                lab.text = [self.problemArray objectAtIndex:indexPath.row-1];
                lab.textAlignment = NSTextAlignmentLeft;
                lab.font = [UIFont systemFontOfSize:15];
                [cell addSubview:lab];
                
                UIImageView *arrowImg = [[UIImageView alloc] init];
                [cell addSubview:arrowImg];
                [arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(lab.mas_top).offset(5);
                    make.right.equalTo(lab.mas_right).offset(-5);
                    make.width.mas_equalTo(20);
                    make.width.mas_equalTo(20);
                }];
                arrowImg.image = [UIImage imageNamed:@"arrowimg_2"];
                            
                UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH-20, 200)];
                testLabel.font = [UIFont systemFontOfSize:20];
                testLabel.numberOfLines = 0;
                testLabel.text = [self.subProblemArray objectAtIndex:indexPath.row-1];
                CGSize size = [testLabel sizeThatFits:CGSizeMake(DEF_SCREEN_WIDTH-20, 200)];
                
                UIView *view = [[UIView alloc] init];
                [cell addSubview:view];
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(lab.mas_bottom).offset(10);
                    make.left.equalTo(cell.mas_left).offset(10);
                    make.right.equalTo(cell.mas_right).offset(-10);
                    make.height.mas_equalTo(size.height+20);
                }];
                view.backgroundColor = [UIColor colorWithHexString:@"EEE9E9"];
                view.layer.masksToBounds = YES;
                view.layer.cornerRadius = 5.0;
                
                UILabel *contentLab = [[UILabel alloc] init];
                [view addSubview:contentLab];
                [contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(view.mas_top).offset(-8);
                    make.left.equalTo(view.mas_left).offset(10);
                    make.right.equalTo(view.mas_right).offset(-10);
                    make.bottom.equalTo(view.mas_bottom).offset(8);
                }];
                contentLab.text = [self.subProblemArray objectAtIndex:indexPath.row-1];
                contentLab.numberOfLines = 0;
                contentLab.font = [UIFont systemFontOfSize:14];
            }
        }
    }
    
    if(indexPath.section == 4)
    {
        if(indexPath.row == 0)
        {
            cell.textLabel.text = @"用户评价";
            UILabel *msgLabel = [[UILabel alloc] init];
            [cell addSubview:msgLabel];
            [msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.textLabel.mas_top).offset(12);
                make.left.equalTo(cell.mas_left).offset(95);
                make.width.mas_offset(DEF_SCREEN_WIDTH);
                make.height.mas_equalTo(25);
            }];
            msgLabel.text = @"(每天采集官网最有价值的5条评论)";
            msgLabel.textColor = [UIColor lightGrayColor];
            msgLabel.font = [UIFont systemFontOfSize:12];
        }
        else
        {
            CommentModel *model = [self.commentArray objectAtIndex:indexPath.row-1];
            UIView *view = [self.sview getRecommandViewWithTitle:model.title
                                                            name:model.name
                                                         starImg:model.imgName
                                                         content:model.commnetString];
            [cell addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.mas_top).offset(10);
                make.bottom.equalTo(cell.mas_bottom).offset(-5);
                make.left.equalTo(cell.mas_left).offset(10);
                make.right.equalTo(cell.mas_right).offset(-10);
            }];
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
    else if(indexPath.section == 3)
    {
        if(indexPath.row == 0)
            return 50;
        int v = [[self.expandArray objectAtIndex:indexPath.row-1] intValue];
        if(v == 0)
            return 50;
        else if(v == 1)
        {
            //动态计算高度
            UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH-20, 200)];
            testLabel.font = [UIFont systemFontOfSize:20];
            testLabel.numberOfLines = 0;
            testLabel.text = [self.subProblemArray objectAtIndex:indexPath.row-1];
            CGSize size = [testLabel sizeThatFits:CGSizeMake(DEF_SCREEN_WIDTH-20, 200)];
            return size.height + 70;
        }
    }
    else if(indexPath.section == 4)
    {
        if(indexPath.row == 0)
            return 50;
        else
        {
            CommentModel *mm = [self.commentArray objectAtIndex:indexPath.row-1];
            //动态计算高度
            UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH-30, 200)];
            testLabel.font = [UIFont systemFontOfSize:18];
            testLabel.numberOfLines = 0;
            testLabel.text = mm.commnetString;
            CGSize size = [testLabel sizeThatFits:CGSizeMake(DEF_SCREEN_WIDTH-20, 200)];
            return size.height + 45;
        }
    }
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 3)
    {
        if(indexPath.row > 0)
        {
            int v = [[self.expandArray objectAtIndex:indexPath.row-1] intValue];
            if(v == 0){
                [self.expandArray replaceObjectAtIndex:indexPath.row-1 withObject:@"1"];
            }
            else
            {
                [self.expandArray replaceObjectAtIndex:indexPath.row-1 withObject:@"0"];
            }
            [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 2)
    {
        return 3;
    }
    else if(section == 3)
    {
        return self.problemArray.count+1;
    }
    else if(section == 4)
    {
        return self.commentArray.count+1;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}



@end
