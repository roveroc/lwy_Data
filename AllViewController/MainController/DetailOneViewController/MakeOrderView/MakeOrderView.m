//
//  MakeOrderView.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/12.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "MakeOrderView.h"
#import "PriceModel.h"
#import <Masonry.h>
#import "ScreenView.h"

@interface MakeOrderView() <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) NSMutableArray    *msgArray;
@property (nonatomic, strong) ScreenView        *sview;

@end

@implementation MakeOrderView
@synthesize delegate;


- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        self.sview = [[ScreenView alloc] init];
        
        PriceModel *model_1 = [[PriceModel alloc] init];
        model_1.imgString = @"item1";
        model_1.titleString = @"夜间加急-专家通宵服务 ￥288";
        model_1.titleColorString = @"EEAD0E";
        model_1.msgString = @"       五游APP是北京西游国际旅行社有限公司旗下的分享平台，用户在平台上分享旅游体验和旅游产品。平台以接待国内游客为主，主做国内旅游业务，拥有百余名熟知近二十种语言的专兼";
                      
        
        PriceModel *model_2 = [[PriceModel alloc] init];
        model_2.imgString = @"item2";
        model_2.titleString = @"加急处理-专家立刻处理 ￥188";
        model_2.titleColorString = @"1E90FF";
        model_2.msgString = @"       具备原创独家线路策划能力，网站线路为原创独立研发；讲究深度体验、以其独特旅游组织方式,讲究深度";
        
        PriceModel *model_3 = [[PriceModel alloc] init];
        model_3.imgString = @"item3";
        model_3.titleString = @"排队处理-按顺序处理 ￥88";
        model_3.titleColorString = @"8A2BE2";
        model_3.msgString = @"       具备原创独家线路策划能力，网站线路为原创独立研发；讲究深度体验、以其独特旅游组织方式,组织方式";
        
        self.msgArray = [[NSMutableArray alloc] initWithObjects:model_1,model_2,model_3, nil];
        
        self.tableView = [[UITableView alloc] init];
        [self addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.left.equalTo(self.mas_left);
            make.width.equalTo(self.mas_width);
            make.height.mas_equalTo(self.mas_height);
        }];

        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    
    return self;
}


- (void)cutomLabelAttribite:(UILabel *)lab msg:(NSString *)msg
{
    //需要特殊显示的价格,因为可能会动态改变,所以单独写出来了
    NSString *price = @"注意:";
    //拼接需要显示的完整字符串
    NSString *string = [NSString stringWithFormat:@"%@%@",price,msg];
    //获取需要改变的字符串在完整字符串的范围
    NSRange rang = [string rangeOfString:price];

    NSMutableAttributedString *attributStr = [[NSMutableAttributedString alloc]initWithString:string];
    //设置文字颜色
    [attributStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:rang];
    //设置文字大小
    [attributStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:rang];
    //设置文字背景色
    //[attributStr addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:rang];
    //赋值
    lab.attributedText = attributStr;
}



#pragma Uitableview  Delegate
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] init];
        
        
        if(indexPath.row > self.msgArray.count-1)
        {
            cell.backgroundColor = [UIColor clearColor];
            UILabel *lab1 = [[UILabel alloc] init];
            UILabel *lab2 = [[UILabel alloc] init];
            UILabel *lab3 = [[UILabel alloc] init];
            
            [cell addSubview:lab1];
            [cell addSubview:lab2];
            [cell addSubview:lab3];
            
            [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.mas_top).offset(10);
                make.left.equalTo(cell.mas_left).offset(10);
                make.width.mas_equalTo(self.frame.size.width);
                make.height.mas_equalTo(25);
            }];
            
            [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lab1.mas_bottom).offset(10);
                make.left.equalTo(cell.mas_left).offset(10);
                make.width.mas_equalTo(self.frame.size.width);
                make.height.mas_equalTo(25);
            }];
            
            [lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lab2.mas_bottom).offset(10);
                make.left.equalTo(cell.mas_left).offset(10);
                make.width.mas_equalTo(self.frame.size.width);
                make.height.mas_equalTo(50);
            }];
            lab3.numberOfLines = 0;
            [self cutomLabelAttribite:lab1 msg:@"预约服务后在开始服务后不支持退款"];
            [self cutomLabelAttribite:lab2 msg:@"数据丢失，越早恢复成功率越高"];
            [self cutomLabelAttribite:lab3 msg:@"数据无价，自行恢复可能导致数据永久丢失，需要恢复请找专业人士"];
            
        }
        else{
            cell.backgroundColor = [UIColor lightTextColor];
            
            PriceModel *model = [self.msgArray objectAtIndex:indexPath.row];
            UIView *v = [self.sview getPriceMsgViewWithImage:model.imgString title:model.titleString titleColor:model.titleColorString msg:model.msgString];
            [cell addSubview:v];
            [v mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell.mas_top).offset(5);
                make.left.equalTo(cell.mas_left).offset(10);
                make.right.equalTo(cell.mas_right).offset(-10);
                make.bottom.equalTo(cell.mas_bottom).offset(-8);
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
    if(indexPath.row > self.msgArray.count-1)
    {
        return 170;
    }
    else
    {
        PriceModel *model = [self.msgArray objectAtIndex:indexPath.row];
        
        UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width-80, 200)];
        testLabel.font = [UIFont systemFontOfSize:16];
        testLabel.numberOfLines = 0;
        testLabel.text = model.msgString;
        CGSize size = [testLabel sizeThatFits:CGSizeMake(self.frame.size.width-80, 200)];
        return size.height + 100;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate orderRowSelected:indexPath.row];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.msgArray.count+1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


@end
