//
//  EWArcTableViewCell.m
//  EWArcTableView-OC
//
//  Created by Ethan.Wang on 2018/11/1.
//  Copyright © 2018 Ethan. All rights reserved.
//

#import "EWArcTableViewCell.h"

@implementation EWArcTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self drawMyView];
    }
    return self;
}

- (void)drawMyView{

    _rightDetailView = [[UIView alloc] initWithFrame:CGRectMake(30, 0, 210, 80)];
    _rightDetailView.backgroundColor = [UIColor colorWithRed:158/255.0 green:154/255.0 blue:200/255.0 alpha:1];
    _rightDetailView.layer.cornerRadius = 40;
    _rightDetailView.layer.masksToBounds = YES;
    [self addSubview:_rightDetailView];

    _personNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(97, 0, 125, 80)];
    _personNameLabel.textColor = [UIColor whiteColor];
    _personNameLabel.font = [UIFont systemFontOfSize:16];
    [_rightDetailView addSubview:_personNameLabel];

    _personHeadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
    _personHeadImageView.layer.cornerRadius = 45;
    _personHeadImageView.layer.masksToBounds = YES;
    [self addSubview:_personHeadImageView];
}

- (void)setMyDataWithImage:(NSString *)personHeaderImage Andname:(NSString *)personName{
    self.personNameLabel.text = personName;
    self.personHeadImageView.image = [UIImage imageNamed:personHeaderImage];
}

@end
