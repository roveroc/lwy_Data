//
//  NewsViewController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/9.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "NewsViewController.h"
#import "BMUtilMacro.h"
#import <Masonry.h>
#import "UIColor+JM.h"
#import "NewsCell.h"
#import "BM_NetAPIClicnet.h"
#import "DetailOneViewController.h"
#import "ChatViewController.h"

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView       *tableView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGFloat height = 0;
    if (IS_IPHONE_X) {
        height = AdaptedHeight(72);
    }else
    {
        height = AdaptedHeight(68);
    }
    
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(height);
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(self.view.mas_width);
        make.height.mas_equalTo(DEF_SCREEN_HEIGHT-height*2+5);
    }];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contactImg.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showContactController)];
    
    NSString *path =[DEF_NETPATH_BASEURL stringByAppendingString:@"/lv-hotel/hotel/getHotelList"];
//       NSDictionary * params = @{@"header":@{@"deviceId":@"2"},
//                                 @"reqBody":@{@"page":DEF_SafeStr(@"1"),
//                                              @"pageSize":DEF_SafeStr(@"10"),
//                                              @"hotelTypeId":DEF_SafeStr(@""),
//                                              @"scenicId":DEF_SafeStr(@""),
//                                              @"hotelName":DEF_SafeStr(@""),
//                                              @"labelId":DEF_SafeStr(@"")}};
//
//       [[BM_NetAPIClicnet sharedJsonClient]requestJsonDataWithPath:path withParams:params withTarget:nil withMethodType:Post withLoading:YES andBlock:^(id data, NSError *error)
//        {
//            if(data){
//                //block(data,nil);
//            }else
//            {
//                //block(nil,error);
//            }
//        }];
    

    
    
    
//    NSString *path = @"http://192.168.110.134:8888/users/login";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
//    [manager.requestSerializer setValue:@"application/json;UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    
    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
    //往字典里面添加需要提交的参数
    [parametersDic setObject:@"13502810641" forKey:@"phone"];
    [parametersDic setObject:@"123456" forKey:@"password"];
    
    // 涉及到用户隐私, 依然要用POST
    [manager POST:path parameters:parametersDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //json数据全局化
//        self.dic = (NSDictionary *)responseObject;
        
        NSData *da = (NSData *)responseObject;
        
        NSString *str = [[NSString alloc] initWithData:da encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", str);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
        NSLog(@"%@", error);
    }];

    
}

#pragma mark ------------ 跳转到联系我们界面
- (void)showContactController
{
    ChatViewController *com = [[ChatViewController alloc] init];
    [self.navigationController pushViewController:com animated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarItem.title = @"动态";
}


#pragma Uitableview  Delegate
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell * cell =[tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
    if (!cell) {
        cell = [[NewsCell alloc] init];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailOneViewController *com = [[DetailOneViewController alloc] init];
    com.functionNo = 1;
    [self.navigationController pushViewController:com animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


@end
