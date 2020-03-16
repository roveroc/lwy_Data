//
//  ShowServiceViewController.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/16.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "ShowServiceViewController.h"
#import "BMUtilMacro.h"

@interface ShowServiceViewController ()

@end

@implementation ShowServiceViewController

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
    UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, height, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT-height)];
    [self.view addSubview:imgview];
    imgview.image = [UIImage imageNamed:@"banner_1.jpg"];
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
