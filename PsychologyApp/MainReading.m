//
//  MainReading.m
//  PsychologyApp
//
//  Created by felix on 16/2/19.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MainReading.h"
#import "ReadingTitleLabelCell.h"
#import "ReadingDetailCell.h"

@interface MainReading ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_titles;
}
@property (weak, nonatomic) IBOutlet UICollectionView *titleCollectionView;
@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@end

@implementation MainReading

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //标题
    NSString *titlePath = [[NSBundle mainBundle] pathForResource:@"ReadingTitle" ofType:@"plist"];
    _titles = [NSArray arrayWithContentsOfFile:titlePath];
    
    //注册titleCell
    [self.titleCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ReadingTitleLabelCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([ReadingTitleLabelCell class])];
    
    //注册tableViewCell
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ReadingDetailCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ReadingDetailCell class])];
    
}


#pragma mark -- UICollectionDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _titles.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ReadingTitleLabelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ReadingTitleLabelCell class]) forIndexPath:indexPath];
    cell.titleTextLabel.text= _titles[indexPath.row];

    return cell;
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ReadingDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ReadingDetailCell class]) forIndexPath:indexPath];
    
    [cell setLeftImageView:@"1" withTitleLabel:@"1分钟心理学：心理学家们拜年是一种怎样的体系 心理学家们拜年是一种怎样的体系" withDetailLabel:@"何林郁" withNumberLabel:1234];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
