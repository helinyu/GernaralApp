//
//  MainReading.m
//  PsychologyApp
//
//  Created by felix on 16/2/19.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MainReading.h"
#import "ReadingDetailCell.h"
#import "ServiceManager.h"
#import "AppOutDefinition.h"
#import "ReadingService.h"
#import "VCRefreshHeader.h"
#import "VCRefreshFooter.h"
#import "CommonWeb.h"
#import "CommonDetailWeb.h"

@implementation TitleCategoryCell
@end

@implementation ReadingContentCell

- (void)awakeFromNib{
    
//    self.contentTableView.mj_footer = 
    
}
@end


#define limitAdd 10

@interface MainReading ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_titles;
    NSMutableArray *_dataSource;
    
//    记录元素
    NSInteger _collectionCellIndex;
    NSInteger _offset;
    NSInteger _limit;
}

@property (weak, nonatomic) IBOutlet UICollectionView *titleCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *contentCollectionView;

@end

@implementation MainReading

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self initBaseVariable];
    [self feedDataAtInitState:0];
    
}

- (void)initBaseVariable{
    
    NSString *titlePath = [[NSBundle mainBundle] pathForResource:@"ReadingTitle" ofType:@"plist"];
    _titles = [NSArray arrayWithContentsOfFile:titlePath];
    _dataSource = [NSMutableArray new];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    ReadingContentCell* cell = (ReadingContentCell*)self.contentCollectionView.visibleCells.firstObject;
    cell.contentTableView.mj_footer = [VCRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(pullAndLoadData)];
}

#pragma mark -- UICollectionDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
        return _titles.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([collectionView isEqual:self.titleCollectionView] ) {
        //    题目要求
        TitleCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TitleCategoryCell class]) forIndexPath:indexPath];
            cell.categoryLabel.text = _titles[indexPath.row];
        return cell;
    }else{
        ReadingContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ReadingContentCell class]) forIndexPath:indexPath];
        [cell.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ReadingDetailCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ReadingDetailCell class])];
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.contentCollectionView selectItemAtIndexPath:indexPath animated:true scrollPosition:UICollectionViewScrollPositionLeft];
    [self feedDataAtInitState:indexPath.row];
}

- (void)feedDataAtInitState:(NSInteger)index{
    
    _collectionCellIndex = index;
    _limit = 10;
    _offset = 10;
    
    [OBTAIN_SERVICE(ReadingService) requestMarriageLove:index withOffset:10 withLimit:10 withComplete:^(NSData *data, NSError *error) {
        
        
        if (error.code != 0) {
            return  ;
        }
        
        NSError *structError = nil  ;
        NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&structError];
        NSArray *tmpDatasource = dict[@"data"];
        [_dataSource setArray:tmpDatasource];
        ReadingContentCell* cell = (ReadingContentCell*)self.contentCollectionView.visibleCells.firstObject;
        [cell.contentTableView reloadData];
    }];
}

- (void)pullAndLoadData{
    NSInteger index = _collectionCellIndex;
    _offset += _limit;
    [OBTAIN_SERVICE(ReadingService) requestMarriageLove:index withOffset:_offset withLimit:_limit withComplete:^(NSData *data, NSError *error) {
        
        ReadingContentCell* cell = (ReadingContentCell*)self.contentCollectionView.visibleCells.firstObject;
        [cell.contentTableView.mj_footer endRefreshing];
        
        if (error.code != 0) {
            return  ;
        }
        
        NSError *structError = nil  ;
        NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&structError];
        NSArray *tmpDatasource = dict[@"data"];
        [_dataSource addObjectsFromArray:tmpDatasource];
        [cell.contentTableView reloadData];
    }];

}

#pragma mark -- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    if ([collectionView isEqual:self.titleCollectionView]) {
        return CGSizeMake(50, 36);
    }else{
        return collectionView.bounds.size;
    }
}


#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReadingDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ReadingDetailCell class]) forIndexPath:indexPath];
    [cell setLeftImageView:_dataSource[indexPath.row][@"cover"] withTitleLabel:_dataSource[indexPath.row][@"app_title"] withDetailLabel:_dataSource[indexPath.row][@"tags"] withNumberLabel:_dataSource[indexPath.row][@"viewnum"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

// UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *_id = [_dataSource[indexPath.row] objectForKey:@"id"];
    CommonWeb *web = [[UIStoryboard storyboardWithName:@"Common" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CommonWeb class])];
    web.pageId = [NSString stringWithFormat:@"%@",_id];
    [self.navigationController pushViewController:web animated:true];
//
//    CommonDetailWeb* commonDetailWeb = [[UIStoryboard storyboardWithName:@"Common" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CommonDetailWeb class])];
//    commonDetailWeb.pageId = _id;
//    [self.navigationController pushViewController:commonDetailWeb animated:true];
}

#pragma mark -- UIScrollviewDelegate

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
