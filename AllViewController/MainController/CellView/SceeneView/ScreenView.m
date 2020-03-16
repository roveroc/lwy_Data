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
    view.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
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



- (UIView *)getPriceMsgViewWithImage:(NSString *)imageName title:(NSString *)title titleColor:(NSString *)colorString msg:(NSString *)msg
{
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH-80, 200)];
    testLabel.font = [UIFont systemFontOfSize:16];
    testLabel.numberOfLines = 0;
    testLabel.text = msg;
    CGSize size = [testLabel sizeThatFits:CGSizeMake(DEF_SCREEN_WIDTH-80, 200)];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH-30, 50+size.height)];
    view.backgroundColor = [UIColor colorWithHexString:@"FFFFFF"];
    view.layer.cornerRadius = 6.0;
    view.layer.shadowColor = [UIColor colorWithHexString:colorString].CGColor;//阴影颜色
    view.layer.shadowOpacity = 0.6;//阴影透明度，默认为0，如果不设置的话看不到阴影，切记，这是个大坑
    view.layer.shadowOffset = CGSizeMake(0, 0);//设置偏移量
    view.layer.cornerRadius = 3.0;
    view.layer.shadowRadius = 3.0;
    
    UIImageView *imgview = [[UIImageView alloc] init];
    [view addSubview:imgview];
    [imgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(18);
        make.left.equalTo(view.mas_left).offset(18);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    imgview.image = [UIImage imageNamed:imageName];
    
    UILabel *titleLab = [[UILabel alloc] init];
    [view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(12);
        make.left.equalTo(imgview.mas_right).offset(5);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH/4*3);
        make.height.mas_equalTo(30);
    }];
    titleLab.textColor = [UIColor colorWithHexString:colorString];
    titleLab.font = [UIFont systemFontOfSize:18];
    titleLab.textAlignment = NSTextAlignmentLeft;
    titleLab.text = title;
    
    UILabel *msgLab = [[UILabel alloc] init];
    [view addSubview:msgLab];
    [msgLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgview.mas_bottom).offset(-5);
        make.left.equalTo(imgview.mas_left).offset(0);
        make.width.mas_equalTo(view.frame.size.width-65);
        make.height.mas_equalTo(size.height+40);
    }];
    msgLab.textColor = [UIColor colorWithHexString:@"696969"];
    msgLab.font = [UIFont systemFontOfSize:15];
    msgLab.textAlignment = NSTextAlignmentLeft;
    msgLab.numberOfLines = 0;
    msgLab.text = msg;
    [self setLineSpace:5.0 withText:msg inLabel:msgLab];
    
    //msgLab.backgroundColor = [UIColor cyanColor];
    
    UIImageView *arrowImg = [[UIImageView alloc] init];
    [view addSubview:arrowImg];
    [arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view.mas_centerY);
        make.right.equalTo(view.mas_right).offset(-15);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(35);
    }];
    arrowImg.image = [UIImage imageNamed:@"arrowimg_1"];
    
    return view;
}


-(void)setLineSpace:(CGFloat)lineSpace withText:(NSString *)text inLabel:(UILabel *)label{
    if (!text || !label) {
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;  //设置行间距
    paragraphStyle.lineBreakMode = label.lineBreakMode;
    paragraphStyle.alignment = label.textAlignment;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    label.attributedText = attributedString;
}


- (UIView *)getTopViewWithImage:(NSString *)imageName title:(NSString *)title msg:(NSString *)msgString
{
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH-100, 200)];
    testLabel.font = [UIFont systemFontOfSize:16];
    testLabel.numberOfLines = 0;
    testLabel.text = msgString;
    CGSize size = [testLabel sizeThatFits:CGSizeMake(DEF_SCREEN_WIDTH-100, 200)];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, 60+size.height)];
    view.backgroundColor = [UIColor colorWithHexString:@"FFFFFF"];
    
    UIImageView *imgview = [[UIImageView alloc] init];
    [view addSubview:imgview];
    [imgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view.mas_centerY);
        make.left.equalTo(view.mas_left).offset(15);
        make.width.mas_equalTo(65);
        make.height.mas_equalTo(65);
    }];
    imgview.image = [UIImage imageNamed:imageName];
    
    
    UILabel *lab = [[UILabel alloc] init];
    [view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgview.mas_top).offset(-5);
        make.left.equalTo(imgview.mas_right).offset(15);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH/2);
        make.height.mas_equalTo(30);
    }];
    lab.text = title;
    lab.textAlignment = NSTextAlignmentLeft;
    lab.textColor = [UIColor darkGrayColor];
    lab.font = [UIFont systemFontOfSize:16];
    
    UILabel *sublab = [[UILabel alloc] init];
    [view addSubview:sublab];
    [sublab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab.mas_bottom).offset(0);
        make.left.equalTo(imgview.mas_right).offset(15);
        make.width.mas_equalTo(DEF_SCREEN_WIDTH - imgview.frame.size.width - 110);
        make.height.mas_equalTo(size.height);
    }];
    sublab.text = title;
    sublab.numberOfLines = 0;
    sublab.textAlignment = NSTextAlignmentLeft;
    sublab.textColor = [UIColor lightGrayColor];
    
    [self setLineSpace:6.0 withText:msgString inLabel:sublab];
    
    sublab.font = [UIFont systemFontOfSize:14];
    
    return view;
}






@end
