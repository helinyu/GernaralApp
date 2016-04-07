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

@implementation TitleCategoryCell
@end

@implementation ReadingContentCell
@end

@interface MainReading ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_titles;
    NSMutableArray *_dataSource;
}
@property (weak, nonatomic) IBOutlet UICollectionView *titleCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *contentCollectionView;

@end

@implementation MainReading

- (void)viewDidLoad {
    [super viewDidLoad];
        
    //标题
    NSString *titlePath = [[NSBundle mainBundle] pathForResource:@"ReadingTitle" ofType:@"plist"];
    _titles = [NSArray arrayWithContentsOfFile:titlePath];
    
    _dataSource = [NSMutableArray new];
    
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
        cell.contentTableView.backgroundColor = [UIColor redColor];
        [cell.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ReadingDetailCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ReadingDetailCell class])];
        
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"index pahthis ; %ld",indexPath.row);
    [self.contentCollectionView selectItemAtIndexPath:indexPath animated:true scrollPosition:UICollectionViewScrollPositionLeft];
    
           [OBTAIN_SERVICE(ReadingService) requestMarriageLove:indexPath.row withOffset:10 withLimit:10 withComplete:^(NSData *data, NSError *error) {
               
               if (error.code != 0) {
                   return  ;
               }
               
               NSError *structError = nil  ;
               NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&structError];
               NSLog(@"arr1 is : %@",dict[@"data"]);
               NSArray *tmpDatasource = dict[@"data"];
               NSLog(@"datasoruce is : %ld",tmpDatasource.count);
               [_dataSource setArray:tmpDatasource];
               ReadingContentCell* cell = (ReadingContentCell*)self.contentCollectionView.visibleCells.firstObject;
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
    NSLog(@"cover is ； %@",_dataSource[indexPath.row][@"cover"]);
    NSLog(@"app_title is ；%@",_dataSource[indexPath.row][@"app_title"]);
    NSLog(@"tags is : %@",_dataSource[indexPath.row][@"tags"]);
    NSLog(@"viewnum is : %@",_dataSource[indexPath.row][@"viewnum"]);
    [cell setLeftImageView:_dataSource[indexPath.row][@"cover"] withTitleLabel:_dataSource[indexPath.row][@"app_title"] withDetailLabel:_dataSource[indexPath.row][@"tags"] withNumberLabel:_dataSource[indexPath.row][@"viewnum"]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
