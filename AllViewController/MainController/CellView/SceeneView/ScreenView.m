//
//  ScreenView.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/10.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "ScreenView.h"
#import "BMUtilMacro.h"
#import "UIColor+JM.h"
#import <Masonry.h>

@implementation ScreenView
@synthesize itemArray;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)getPriceViewWithPrice:(int)newPriceValue oldPriceValue:(int)oldprice image:(NSString *)priceImageName title:(NSString *)titleString height:(int)h
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, h)];
    
    UIImageView *img = [[UIImageView alloc] init];
    [view addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(10);
        make.left.equalTo(view.mas_left).offset(10);
        make.height.mas_equalTo(h-30);
        make.width.mas_equalTo(h-30);
    }];
    img.image = [UIImage imageNamed:priceImageName];
    
    UILabel *label1 = [[UILabel alloc] init];
    [view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(10);
        make.left.equalTo(img.mas_right).offset(15);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(200);
    }];
    label1.text = titleString;
    
    
    UILabel *label2 = [[UILabel alloc] init];
    [view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view.mas_bottom).offset(-20);
        make.left.equalTo(img.mas_right).offset(5);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(80);
    }];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor redColor];
    label2.text = [NSString stringWithFormat:@"￥ %d 起",newPriceValue];

    UILabel *label3 = [[UILabel alloc] init];
    [view addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view.mas_bottom).offset(-20);
        make.left.equalTo(label2.mas_right).offset(5);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(200);
    }];
    label3.textAlignment = NSTextAlignmentLeft;
    label3.textColor = [UIColor grayColor];
    NSString *str = [NSString stringWithFormat:@"原价:%d 起",oldprice];

    NSAttributedString *attrStr =
    [[NSAttributedString alloc]initWithString:str
                                  attributes:
    @{NSFontAttributeName:[UIFont systemFontOfSize:15.f],
      NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#8B8989"],
      NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid),
      NSStrikethroughColorAttributeName:[UIColor colorWithHexString:@"#8B8989"]}];

    label3.attributedText = attrStr;
        
    return view;
}


- (UIView *)getScreenView
{
    int h = (self.itemArray.count % 3) == 0 ? (int)(self.itemArray.count / 3) : (int)((self.itemArray.count / 3)+1);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH-(10*4), h*60 + 60)];
    
    UILabel *titleview = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, DEF_SCREEN_WIDTH, 45)];
    titleview.textAlignment = NSTextAlignmentLeft;
    titleview.text = @"适应场景";
    [view addSubview:titleview];
    
    NSArray * titleArr = itemArray;
    int size = (DEF_SCREEN_WIDTH-(10*4))/3;
    CGFloat spacing = 10;
    for (int i=0; i<titleArr.count; i++) {
        
        NSInteger index = i % 3;
        NSInteger page = i / 3;
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(index * (AdaptedWidth(size) + spacing) + spacing, page * (55 + AdaptedHeight(5))+44, size, 55)];
        [button setBackgroundColor:[UIColor colorWithHexString:[self.itemBackColorArray objectAtIndex:i]]];
        button.tag = i+100;
        
        button.titleLabel.lineBreakMode = 0;
        
        [view addSubview:button];
        
        [button setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"Arial" size:14];
    }
    
    
    return view;
}


- (UIView *)getServiceView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, 40)];
    
    UILabel *label1 = [[UILabel alloc] init];
    [view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(10);
        make.top.equalTo(view.mas_top).offset(5);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(80);
    }];
    label1.text = @"服务动态";
    
    UILabel *label2 = [[UILabel alloc] init];
    [view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_right).offset(5);
        make.top.equalTo(view.mas_top).offset(5);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH);
    }];
    label2.textColor = [UIColor lightGrayColor];
    label2.font = [UIFont fontWithName:@"Arial" size:12];
    label2.text = @"(非实时更新数据，有延迟播报可能)";
    
    
    return view;
}

- (UIView *)getServiceMoveViewWithImage:(NSString *)imgName name:(NSString *)name content:(NSString *)content time:(int)time
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, 55)];
    
    UIImageView *img = [[UIImageView alloc] init];
    [view addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(10);
        make.left.equalTo(view.mas_left).offset(10);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(35);
    }];
    img.image = [UIImage imageNamed:imgName];
    
    UILabel *label1 = [[UILabel alloc] init];
    [view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(5);
        make.left.equalTo(img.mas_right).offset(15);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(200);
    }];
    label1.font = [UIFont fontWithName:@"Arial" size:11];
    label1.textColor = [UIColor lightGrayColor];
    label1.text = name;
    
    UILabel *label2 = [[UILabel alloc] init];
    [view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_bottom).offset(-2);
        make.left.equalTo(img.mas_right).offset(15);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(250);
    }];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.textColor = [UIColor darkGrayColor];
    label2.font = [UIFont fontWithName:@"Arial" size:13];
    label2.text = content;

    UILabel *label3 = [[UILabel alloc] init];
    [view addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(5);
        make.right.equalTo(view.mas_right).offset(-25);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(50);
    }];
    label3.font = [UIFont fontWithName:@"Arial" size:11];
    label3.textAlignment = NSTextAlignmentLeft;
    label3.textColor = [UIColor grayColor];
    label3.text = [NSString stringWithFormat:@"%d分钟前",time];
    
    
    return view;
}


- (UIView *)getRecommandViewWithTitle:(NSString *)title name:(NSString *)name starImg:(NSString *)imgName content:(NSString *)content
{
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH-45, 200)];
    testLabel.font = [UIFont systemFontOfSize:16];
    testLabel.numberOfLines = 0;
    testLabel.text = content;
    CGSize size = [testLabel sizeThatFits:CGSizeMake(DEF_SCREEN_WIDTH-45, 200)];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH-30, 50+size.height)];
    view.backgroundColor = [UIColor colorWithHexString:@"EEE9E9"];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5.0;
    
    UILabel *titleLab = [[UILabel alloc] init];
    [view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(5);
        make.left.equalTo(view.mas_left).offset(10);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH/2);
        make.height.mas_equalTo(25);
    }];
    titleLab.textAlignment = NSTextAlignmentLeft;
    titleLab.font = [UIFont systemFontOfSize:16];
    titleLab.text = title;
    
    UILabel *nameLab = [[UILabel alloc] init];
    [view addSubview:nameLab];
    [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(8);
        make.right.equalTo(view.mas_right).offset(-20);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH/3);
        make.height.mas_equalTo(25);
    }];
    nameLab.textAlignment = NSTextAlignmentRight;
    nameLab.font = [UIFont systemFontOfSize:12];
    nameLab.textColor = [UIColor lightGrayColor];
    nameLab.text = name;
    
    UIImageView *imgview = [[UIImageView alloc] init];
    [view addSubview:imgview];
    [imgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(5);
        make.left.equalTo(titleLab.mas_left);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(8);
    }];
    imgview.image = [UIImage imageNamed:@"star"];
    
    UILabel *contentLab = [[UILabel alloc] init];
    [view addSubview:contentLab];
    [contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgview.mas_top).offset(10);
        make.left.equalTo(imgview.mas_left);
        make.right.equalTo(view.mas_right).offset(-10);
        make.height.mas_equalTo(size.height);
    }];
    contentLab.textColor = [UIColor darkGrayColor];
    contentLab.font = [UIFont systemFontOfSize:15];
    contentLab.numberOfLines = 0;
    contentLab.text = content;
    
    return view;
}


@end
