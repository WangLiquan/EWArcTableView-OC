//
//  EWArcTableViewCell.h
//  EWArcTableView-OC
//
//  Created by Ethan.Wang on 2018/11/1.
//  Copyright © 2018 Ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EWArcTableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView *personHeadImageView;
@property (nonatomic,strong) UIView *rightDetailView;
@property (nonatomic,strong) UILabel *personNameLabel;

- (void)setMyDataWithImage:(NSString *)personHeaderImage Andname: (NSString *)personName;
@end

NS_ASSUME_NONNULL_END
