//
//  ChatViewController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/16.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()<RCIMUserInfoDataSource>

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
     [self buildNav];
   
    
    
    [[RCIMClient sharedRCIMClient] getHumanEvaluateCustomerServiceConfig:^(NSDictionary *evaConfig) {
      //  NSArray *array = [evaConfig valueForKey:@"evaConfig"];
        dispatch_async(dispatch_get_main_queue(), ^{
//            if (array) {
//                for (NSDictionary *dic in array) {
//                    RCDCSEvaluateModel *model = [RCDCSEvaluateModel modelWithDictionary:dic];
//                    [self.evaStarDic setObject:model forKey:[NSString stringWithFormat:@"%d",model.score]];
//                }
//            }
        });
    }];
    
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
    // 设置消息体内是否携带用户信息
    [RCIM sharedRCIM].globalMessageAvatarStyle = RC_USER_AVATAR_CYCLE;
 
    //刷新融云对应用户信息
     [[RCIM sharedRCIM] clearUserInfoCache];
    RCUserInfo *userInfo = [[RCUserInfo alloc]init];
//    userInfo.userId = [AppDelegate shareAppDelegate].csInfo.userId;
//    userInfo.name = [AppDelegate shareAppDelegate].csInfo.name;
//    userInfo.portraitUri = [AppDelegate shareAppDelegate].csInfo.portraitUrl;
//    [[RCIM sharedRCIM]refreshUserInfoCache:userInfo withUserId:[AppDelegate shareAppDelegate].csInfo.userId];
    //默认输入类型为语音,这里修改为默认显示加号区域
    self.defaultInputType = RCChatSessionInputBarControlCSRobotType;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
    self.navigationItem.rightBarButtonItems = nil;
   
}




#pragma mark-创建导航栏
-(void) buildNav
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"nav_icon_back"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn addTarget:self action:@selector(onClickBack) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItems = @[item];
    
//    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn2 setTitle:@"人工服务" forState:UIControlStateNormal];
//    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btn2 setImage:[UIImage imageNamed:@"info_icon7"] forState:UIControlStateNormal];
//    btn2.titleLabel.font = [UIFont systemFontOfSize:KScaleWidth(13)];
//    btn2.frame = CGRectMake(0, 0, 90, 30);
//    [btn2 addTarget:self action:@selector(onClickPeopleServer) forControlEvents:UIControlEventTouchUpInside];
//
//    [btn2 setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
//
//    UIBarButtonItem * item2 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
//    self.navigationItem.rightBarButtonItems = @[item2];
    
  
}

//#pragma mark-人工服务
//-(void)onClickPeopleServer
//{
//    self.conversationType = ConversationType_PRIVATE;
//    self.targetId = @"";
//}



#pragma mark-返回上一界面
-(void)onClickBack
{
    
//    BMUserModel *user = [BMUserModel getUserInfoFromlocal];
//    if (user.userId && user.userId.length>0) {
//        [self requestimSetIMUse:self.csInfo.userId isTemporary:@"0" headImage:self.csInfo.portraitUrl];
//    }else{
//        [self requestimSetIMUse:self.csInfo.userId isTemporary:@"1" headImage:self.csInfo.portraitUrl];
//    }
    
//    if (self.isMsgInto) {
//        self.navigationController.tabBarController.selectedIndex = 0;
//        //[AppDelegate shareAppDelegate].selIdx = 0;
//        [self customerServiceLeftCurrentViewController];
////        self.navigationController.tabBarController.selectedIndex = 0;
//     //   [self.navigationController popToRootViewControllerAnimated:NO];
//
//    }else{
//        [self customerServiceLeftCurrentViewController];
//      // [self.navigationController popViewControllerAnimated:YES];
//    }
    
    [self customerServiceLeftCurrentViewController];
   
}
- (void)didMoveToParentViewController:(UIViewController*)parent
{
    [super didMoveToParentViewController:parent];
    
    if(!parent){
        NSLog(@"离开了页面");
        [self.navigationController popToRootViewControllerAnimated:YES];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"leave" object:nil];
    }
}
//
//#pragma mark-退出时
//-(void)requestimSetIMUse:(NSString *)userId isTemporary:(NSString *)isTemporary headImage:(NSString *)headImage
//{
//
//
//    [BM_NetAPIManager request_imSetIMUseWithTarget:self imId:userId
//                                       isTemporary:isTemporary
//                                          andBlock:^(id responseData, NSError *error) {
//
//          if(!error)
//          {
//              if ([responseData[@"code"] integerValue]==200) {
//                  NSDictionary *dict = responseData[@"object"] ;
//
//              }else{
//                //  DEF_SHOWMESSAGE
//              }
//          }
//      }];
//}


- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *userInfo))completion
{
    //查看userId是否为空
//    if(userId == nil || userId.length == 0){
//        completion(nil);
//        return;
//    }
//    //是否为自己id
//    if([userId isEqualToString:[AppDelegate shareAppDelegate].csInfo.userId]){
//
//      //  RCUserInfo * myselfInfo = [[RCUserInfo alloc]initWithUserId:[AppDelegate shareAppDelegate].csInfo.userId name:[AppDelegate shareAppDelegate].csInfo.name portrait:[AppDelegate shareAppDelegate].csInfo.portraitUrl];
//
//        RCUserInfo *userInfo = [[RCUserInfo alloc]init];
//        userInfo.userId = [AppDelegate shareAppDelegate].csInfo.userId;
//        userInfo.name = [AppDelegate shareAppDelegate].csInfo.name;
//        userInfo.portraitUri = [AppDelegate shareAppDelegate].csInfo.portraitUrl;
//        [[RCIM sharedRCIM]refreshUserInfoCache:userInfo withUserId:[AppDelegate shareAppDelegate].csInfo.userId];
//
//        completion(userInfo);
//       // self.csInfo = info;
//
//    }
//
//
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

