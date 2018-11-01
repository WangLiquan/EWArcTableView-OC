//
//  EWArcTableView.m
//  EWArcTableView-OC
//
//  Created by Ethan.Wang on 2018/11/1.
//  Copyright © 2018 Ethan. All rights reserved.
//

#import "EWArcTableView.h"

@implementation EWArcTableView
{
    int mTotalCellsVisible;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    self.backgroundColor = [UIColor clearColor];
    mTotalCellsVisible = 0;
    return self;
}
/**
 获取第一个Cell的X轴偏移量

 @param yOffset tableView.contentOffset.y
 @return 第一个Cell的X轴偏移量
 */
- (CGFloat)getAngleForYOffset:(CGFloat)yOffset {
    /// 运用三角函数知识,如果不了解就不用看了.直接拿来用
    CGFloat shift = (int)self.contentOffset.y % (int)self.rowHeight;
    CGFloat percentage = shift / self.rowHeight;
    CGFloat angle_gap = M_PI / (mTotalCellsVisible + 1);
    int rows = 0;
    if (yOffset < 0.0) {
        rows = fabs((Float64)yOffset) / self.rowHeight;
    }
    return fabs((Float64)angle_gap * (1.0 - percentage)) + rows * angle_gap;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    mTotalCellsVisible = (int)self.frame.size.height / self.rowHeight;
    [self setupShapeFormationInVisibleCells];
}
/**
 在layOutSubViews时调用,为每个Cell重新赋frame.origin.x值,达到弧形展示效果
 */
- (void)setupShapeFormationInVisibleCells{
    /// 能在页面展示的所有cell.indexPath
    NSArray *indexPaths = self.indexPathsForVisibleRows;
    NSUInteger totalVisibleCells = indexPaths.count;
    CGFloat angle_gap = M_PI / (mTotalCellsVisible + 1);
    CGFloat vRadius = (self.frame.size.height - self.rowHeight * 2.0) / 2.0;
    CGFloat hRadius = self.frame.size.height / 2.0;
    CGFloat radius = vRadius < hRadius ? vRadius : hRadius;
    /// 可以通过修改xRadius来修改弧度
    CGFloat xRadius = radius - 100;
    CGFloat firstCellAngle = [self getAngleForYOffset:self.contentOffset.y];
    // 通过循环获取展示的所有Cell,依次赋值
    for (int i = 0; i < totalVisibleCells; i++) {
        UITableViewCell *cell = [self cellForRowAtIndexPath:indexPaths[i]];
        CGRect frame = cell.frame;
        CGFloat angle = firstCellAngle;
        firstCellAngle += angle_gap;
        angle -= M_PI_2;
        CGFloat x = xRadius * cosf(angle);
        /// 进行简单适配
        frame.origin.x = x - 90 + (812 - UIScreen.mainScreen.bounds.size.height) * 95/145;
        /* 可以通过修改height来实现每个Cell高度渐变效果,页面中间cell最大,上下逐渐变小
        frame.size.height = self.rowHeight * cosf(angle * 0.6);
         */
        /// 保证x值可用
        if (!isnan(x)) {
            cell.frame = frame;
        }
    }
}
@end
