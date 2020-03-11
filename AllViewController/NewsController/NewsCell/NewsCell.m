//
//  NewsCell.m
//  DataRecovery
//
//  Created by 北京西游国际旅行社 on 2020/3/11.
//  Copyright © 2020 北京西游国际旅行社. All rights reserved.
//

#import "NewsCell.h"
#import <Masonry.h>

@implementation NewsCell


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imgview = [[UIImageView alloc] init];
        [self addSubview:imgview];
        [imgview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.left.equalTo(self.mas_left).offset(10);
            make.height.mas_equalTo(80);
            make.width.mas_equalTo(80);
        }];
        imgview.image = [UIImage imageNamed:@"item1"];        
        
        UILabel *msgLabel = [[UILabel alloc] init];
        [self addSubview:msgLabel];
        [msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.left.equalTo(imgview.mas_right).offset(10);
            make.bottom.equalTo(self.mas_bottom).offset(-25);
            make.right.equalTo(self.mas_right).offset(-30);
        }];
        msgLabel.text = @"老五游（love you）是北京西游国际旅行社有限公司旗下旅游分享平台，用户在平台上分享旅游体验和旅游产品。";
        msgLabel.textAlignment = NSTextAlignmentLeft;
        msgLabel.textColor = [UIColor darkGrayColor];
        msgLabel.numberOfLines = 0;
        msgLabel.font = [UIFont systemFontOfSize:14];
        
        UILabel *timeLabel = [[UILabel alloc] init];
        [self addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(-2);
            make.right.equalTo(self.mas_right).offset(-15);
            make.width.mas_equalTo(160);
            make.height.mas_equalTo(20);
        }];
        timeLabel.text = @"2021-09-12-12";
        timeLabel.textAlignment = NSTextAlignmentRight;
        timeLabel.textColor = [UIColor lightGrayColor];
        timeLabel.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
