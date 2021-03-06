//
//  MainViewController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/9.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "MainViewController.h"
#import "BMUtilMacro.h"
#import <Masonry.h>
#import "UIColor+JM.h"
#import "DetailOneViewController.h"
#import "DetailModeTowViewController.h"
#import "ShowServiceViewController.h"
#import "ChatViewController.h"
#import <IQKeyboardManager.h>

#define BigImageHeight  320

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, retain) UITableView   *tableView;
@property (nonatomic, retain) UIView        *topView;
@property (nonatomic, retain) UIImageView   *topImageView;

@end

@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //键盘管理
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = NO;
    manager.enableAutoToolbar = YES;
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"0xF5F5F5"];
    [self.view addSubview:self.tableView];
    
    [self topBigView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}


#pragma mark ------------------------ 顶部放大视图
- (void)topBigView
{
    UIImageView *topImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner_1.jpg"]];
    topImageView.contentMode = UIViewContentModeScaleAspectFill;
    // 1.图片的Y值设置为“-图片高度”
    topImageView.frame = CGRectMake(0, -320, DEF_SCREEN_WIDTH, BigImageHeight);
    _topImageView = topImageView;
    // 2.把图片插入到TableView的底部
    [self.tableView insertSubview:topImageView atIndex:0];
    // 3.设置TableView的内边距为“图片高度的一半”, 也就是说默认图片会露出来一半
    self.tableView.contentInset = UIEdgeInsetsMake(BigImageHeight / 2+ 20, 0, 0, 0);
}


#pragma mark ------------- 监测uitableview滑动，放大图片
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //计算出Y轴的偏移量, 默认的位置为“-图片高度”, 所以需要加上图片高度的一半
//    CGFloat offsetY = scrollView.contentOffset.y + BigImageHeight / 2;
//    if (offsetY > 0) {
//        return;
//    }
//    //计算缩放比例 = 偏移量 / 屏幕高度 * 阻尼系数 (阻尼系数越大, 越难拖动)
//    CGFloat scale = - offsetY / BigImageHeight * 1;
//    _topImageView.transform = CGAffineTransformMakeScale(1 + scale, 1 + scale);
}



#pragma mark ------------------------ 中间功能区点击事件
-(void)itemBtnClick:(UIButton *)btn
{
    int tag = (int)btn.tag;
    switch (tag) {
        case 100:
        {
            DetailOneViewController *Com = [[DetailOneViewController alloc] init];
            Com.functionNo = 1;
            [self.navigationController pushViewController:Com animated:YES];
        }
            break;
        case 101:
        {
            DetailOneViewController *Com = [[DetailOneViewController alloc] init];
            Com.functionNo = 2;
            [self.navigationController pushViewController:Com animated:YES];
        }
            break;
        case 102:
        {
            DetailOneViewController *Com = [[DetailOneViewController alloc] init];
            Com.functionNo = 3;
            [self.navigationController pushViewController:Com animated:YES];
        }
            break;
        case 103:
        {
            DetailOneViewController *Com = [[DetailOneViewController alloc] init];
            Com.functionNo = 4;
            [self.navigationController pushViewController:Com animated:YES];
        }
            break;
        case 104:
        {
            DetailModeTowViewController *Com = [[DetailModeTowViewController alloc] init];
            Com.functionNo = 5;
            [self.navigationController pushViewController:Com animated:YES];
        }
            break;
        case 105:
        {
            DetailModeTowViewController *Com = [[DetailModeTowViewController alloc] init];
            Com.functionNo = 6;
            [self.navigationController pushViewController:Com animated:YES];
        }
            break;
        case 106:
        {
            DetailModeTowViewController *Com = [[DetailModeTowViewController alloc] init];
            Com.functionNo = 7;
            [self.navigationController pushViewController:Com animated:YES];
        }
            break;
        case 107:
        {
            DetailModeTowViewController *Com = [[DetailModeTowViewController alloc] init];
            Com.functionNo = 8;
            [self.navigationController pushViewController:Com animated:YES];
        }
            break;
            
        default:
            break;
    }
}


#pragma Uitableview  Delegate
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
       cell = [[UITableViewCell alloc] init];
    }
    cell.backgroundColor = [UIColor colorWithHexString:@"0xF5F5F5"];
    if(indexPath.row == 1)
    {
        
    }
    if(indexPath.row == 0)
    {
        UIView * headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, AdaptedHeight(320))];
        headView.backgroundColor = [UIColor whiteColor];
        //headView.layer.masksToBounds = YES;
        headView.layer.cornerRadius = 0;

        
        NSArray * imageArr = @[@"item1",@"item2",@"item3",@"item4",@"item5",@"item6",@"item7",@"item8"];
        NSArray * titleArr = @[@"恢复微信消息",@"加会微信好友",@"清楚微信记录",@"照片视频恢复",@"QQ恢复",@"电脑数据恢复",@"清除手机数据",@"综合恢复套餐"];
        int size = 85;
        CGFloat spacing = (DEF_SCREEN_WIDTH-(size*3))/4;
        for (int i=0; i<imageArr.count; i++) {
            
            NSInteger index = i % 3;
            NSInteger page = i / 3;
            int h_gap = 15;
            if(page == 0)
                h_gap = 30;
            
            UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(index * (AdaptedWidth(size) + spacing) + spacing, page  * (AdaptedWidth(size) + AdaptedHeight(30))+AdaptedHeight(h_gap), AdaptedWidth(size+10), AdaptedWidth(size+10))];
            [button setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
            button.tag = i+100;
            [button addTarget:self action:@selector(itemBtnClick:) forControlEvents:UIControlEventTouchUpInside
             ] ;
            [headView addSubview:button];
            
            int h_gap_1 = 0;
            if(page == 0)
                h_gap_1 = 15;
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(index * DEF_SCREEN_WIDTH/3, page  * (AdaptedWidth(size) + AdaptedHeight(30))+AdaptedHeight(82)+h_gap_1, DEF_SCREEN_WIDTH/3, AdaptedWidth(25))];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = titleArr[i];
            label.font = [UIFont systemFontOfSize:15];
            label.textColor = [UIColor colorWithHexString:@"#666666"];
            [headView addSubview:label];
            
            label.center = CGPointMake(button.center.x, label.center.y);
        }
        [cell addSubview:headView];
    }
    if(indexPath.row == 2)
    {
        UIView *baseview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        baseview.backgroundColor = [UIColor colorWithHexString:@"0xF5F5F5"];
        [cell addSubview:baseview];
        [baseview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cell.mas_top).offset(10);
            make.bottom.equalTo(cell.mas_bottom).offset(-10);
            make.left.equalTo(cell.mas_left).offset(10);
            make.right.equalTo(cell.mas_right).offset(-10);
        }];
        
        UIView *view1 = [[UIView alloc] init];
        view1.backgroundColor = [UIColor colorWithHexString:@"0xF5F5F5"];
        [baseview addSubview:view1];
        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(baseview.mas_top);
            make.bottom.equalTo(baseview.mas_bottom);
            make.left.equalTo(baseview.mas_left);
            make.width.equalTo(baseview.mas_width).dividedBy(2);
        }];

        UIImageView *serviceImg = [[UIImageView alloc] init];
        [view1 addSubview:serviceImg];
        [serviceImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view1.mas_top).offset(10);
            make.left.equalTo(view1.mas_left).offset(30);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(40);
        }];
        serviceImg.image = [UIImage imageNamed:@"serviceImg.png"];


        UIButton *serviceBtn = [[UIButton alloc] init];
        [view1 addSubview:serviceBtn];
        [serviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view1.mas_top).offset(5);
            make.left.equalTo(serviceImg.mas_right).offset(1);
            make.width.mas_equalTo(DEF_SCREEN_WIDTH/2-60-30-15);
            make.height.mas_equalTo(60);
        }];
        serviceBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:14];
        serviceBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [serviceBtn setTitle:@"服务流程" forState:UIControlStateNormal];
        [serviceBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [serviceBtn addTarget:self action:@selector(serviceBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIView *view2 = [[UIView alloc] init];
        view2.backgroundColor = [UIColor colorWithHexString:@"0xF5F5F5"];
        [baseview addSubview:view2];
        [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(baseview.mas_top);
            make.bottom.equalTo(baseview.mas_bottom);
            make.right.equalTo(baseview.mas_right);
            make.width.equalTo(baseview.mas_width).dividedBy(2);
        }];

        UIImageView *contactImg = [[UIImageView alloc] init];
        [view2 addSubview:contactImg];
        [contactImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view2.mas_top).offset(10);
            make.left.equalTo(view2.mas_left).offset(30);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(40);
        }];
        contactImg.image = [UIImage imageNamed:@"contactService.png"];

        UIButton *contactBtn = [[UIButton alloc] init];
        [view2 addSubview:contactBtn];
        [contactBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view2.mas_top).offset(5);
            make.left.equalTo(contactImg.mas_right).offset(1);
            make.width.mas_equalTo(DEF_SCREEN_WIDTH/2-60-10-15);
            make.height.mas_equalTo(60);
        }];
        contactBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:14];
        contactBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [contactBtn setTitle:@"联系客服" forState:UIControlStateNormal];
        [contactBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [contactBtn addTarget:self action:@selector(contactBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //设置点击是透明色
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor clearColor];
    bgColorView.layer.masksToBounds = YES;
    cell.selectedBackgroundView = bgColorView;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;//AdaptedHeight(320);
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
        return AdaptedHeight(340);
    if(indexPath.row == 1)
        return 10;
    return 80;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark ----------------------- 服务流程
- (void)serviceBtnClicked:(id)sender
{
    ShowServiceViewController *com = [[ShowServiceViewController alloc] init];
    [self.navigationController pushViewController:com animated:YES];
}


#pragma mark ----------------------- 联系客户
- (void)contactBtnClicked:(id)sender
{
    ChatViewController *com = [[ChatViewController alloc] init];
    [self.navigationController pushViewController:com animated:YES];
}


@end
