//
//  GroupViewController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/9.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "GroupViewController.h"
#import "ChatViewController.h"
#import "BMUtilMacro.h"

@interface GroupViewController ()

@property (nonatomic, retain) UIWebView *webView;

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGFloat height =0;
    if (IS_IPHONE_X) {
        height = AdaptedHeight(72);
    }else
    {
        height = AdaptedHeight(68);
    }
    
    
    NSURL *url = [NSURL URLWithString:@"https://www.xiyoucts.com/about"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, height, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT-height*2+5)];
    // 设置内边距
//    self.webView.scrollView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    //内容是否自适应
    self.webView.scalesPageToFit = YES;
    [self.webView loadRequest:request];
    
    [self.view addSubview:self.webView];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contactImg.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showContactController)];
    
}


#pragma mark ------------ 跳转到联系我们界面
- (void)showContactController
{
    ChatViewController *com = [[ChatViewController alloc] init];
    [self.navigationController pushViewController:com animated:YES];
}



- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarItem.title = @"团队";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
