//
//  MainHomePage.m
//  PsychologyApp
//
//  Created by felix on 16/2/19.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MainHomePage.h"
#import "MJBannnerPlayer.h"
#import "ImageAndTitleCell.h"
#import "ArticleAndTestCell.h"

@interface MainHomePage ()<MJBannnerPlayerDeledage,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet MJBannnerPlayer *bannerPlayerView;
@property (weak, nonatomic) IBOutlet UICollectionView *ImageTextCollectionView;
@property (weak, nonatomic) IBOutlet UITableView *articleAndTestTableView;

@end

@implementation MainHomePage


- (void)viewDidLoad {
    [super viewDidLoad];

    //去掉自动的导航栏的高度
    self.automaticallyAdjustsScrollViewInsets = NO;

    //图片轮播
    NSArray *temp = @[[UIImage imageNamed:@"ad_first"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"1"],[UIImage imageNamed:@"4.jpg"]];
    [MJBannnerPlayer initWithSourceArray:temp
                               addTarget:self.bannerPlayerView
                                delegate:self
                                withSize:self.bannerPlayerView.bounds
                        withTimeInterval:2.f];
    
    //注册CollectionViewCell
    [self.ImageTextCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ImageAndTitleCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([ImageAndTitleCell class])];
    
    //register UITableViewCell
    [self.articleAndTestTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ArticleAndTestCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ArticleAndTestCell class])];
    
    
}


#pragma mark --MJBannerPlayerDelegate
-(void)MJBannnerPlayer:(UIView *)bannerPlayer didSelectedIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}

#pragma mark --UiCollectionViewDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageAndTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ImageAndTitleCell class]) forIndexPath:indexPath];
    [cell setImageTitle:@"btn_main_vr_location" andTextTitle:@"hello"];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}


#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ArticleAndTestCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ArticleAndTestCell class]) forIndexPath:indexPath];

    switch (indexPath.row) {
        case 0:
            cell.backgroundColor  = [UIColor yellowColor];
            break;
        case 1:
            cell.backgroundColor = [UIColor greenColor];
            break;
        case 2:
            cell.backgroundColor = [UIColor blueColor];
            break;
        default:
            break;
    }
    return cell;
}


//这里应该设置高度

#pragma mark --UiCollectionViewDelegate

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
