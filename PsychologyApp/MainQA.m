//
//  MainQA.m
//  PsychologyApp
//
//  Created by felix on 16/2/19.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MainQA.h"
#import "QAMainCell.h"
#import "MJRefresh.h"

@interface MainQA ()<UITableViewDataSource,UITableViewDelegate>
{
       CGFloat _cellHeight;
}

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@end

@implementation MainQA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

    //注册tableViewcell
    [self.mainTableView registerNib:[UINib nibWithNibName:NSStringFromClass([QAMainCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QAMainCell class])];
    
    self.mainTableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(doSomethings)];
}

- (void)doSomethings{
    NSLog(@"doSomethings");
}
#pragma mark --tableDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QAMainCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QAMainCell class]) forIndexPath:indexPath];
    
   CGFloat cellHeight = [cell setTitleTextLabel:@"文章标题" withTimeLabel:@"时间" withTextContentLabel:@"始在影视圈崭露头角[1]  。2005年拍摄古装剧《锦衣卫》。2007年主演赵宝刚导演的青春剧《奋斗》；[2]  同年，主演首部电影《走着瞧》始在影视圈崭露头角[1]  。2005年拍摄古装剧《锦衣卫》。2007年主演赵宝刚导演的青春剧《奋斗》；[2]  同年，主演首部电影《走着瞧》" withTypeConsultLabel:@"婚恋状况" withNumberTextLabel:16];
    
       _cellHeight = cellHeight;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellHeight;
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
