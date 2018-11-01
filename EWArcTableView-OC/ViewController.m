//
//  ViewController.m
//  EWArcTableView-OC
//
//  Created by Ethan.Wang on 2018/11/1.
//  Copyright © 2018 Ethan. All rights reserved.
//

#import "ViewController.h"
#import "EWArcTableView.h"
#import "EWArcTableViewCell.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    EWArcTableView *tableView;
}

@property (nonatomic,strong) NSArray *personNameArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.personNameArray = @[@"刘一",@"陈二",@"张三",@"李四",@"王五",@"赵六",@"孙七",@"周八",@"吴九",@"郑十"];
    [self drawMyTabelView];
}

- (void)drawMyTabelView{
    tableView = [[EWArcTableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = 90;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.personNameArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";

    EWArcTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell){
        cell = [[EWArcTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    [cell setMyDataWithImage:[NSString stringWithFormat:@"%ld",(long)indexPath.row + 1] Andname: self.personNameArray[indexPath.row]];
    return cell;
}


@end


