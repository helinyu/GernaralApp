//
//  MainConsult.m
//  PsychologyApp
//
//  Created by felix on 16/2/19.
//  Copyright © 2016年 felix. All rights reserved.

#import "MainConsult.h"
#import "ReadingTitleLabelCell.h"
#import "ConsultMainSummarizeCell.h"

typedef NS_ENUM(NSInteger, TopicType) {
    TopicType0 = 0,
    TopicType1
};

typedef NS_ENUM(NSInteger ,ListType){
    ListType0 = 0 ,
    ListType1
};

#define HOTCELLID NSStringFromClass([ConsultMainSummarizeCell class])
#define NEWCELLID @"ConsultNewTopicCell"
#define EXPERTCELLID @"ExpertDetailCell"

@interface MainConsult () <UITableViewDataSource,UITableViewDelegate>
{
    NSInteger _topicIndex;
    NSInteger _listType;
    CGFloat _cellHeight;
}

@property (weak, nonatomic) IBOutlet UITableView *consultMianSummarizeTableView;
@property (weak, nonatomic) IBOutlet UIButton *hotTopicButton;
@property (weak, nonatomic) IBOutlet UIButton *newestTopicButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *titleSegmentedControl;

@property (weak, nonatomic) IBOutlet UIView *twoTitleView;

@end

@implementation MainConsult

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //tableView 注册cell  r热门话题
    [self.consultMianSummarizeTableView registerNib:[UINib nibWithNibName:HOTCELLID bundle:nil] forCellReuseIdentifier:HOTCELLID];
    
    //最新话题
    [self.consultMianSummarizeTableView registerNib:[UINib nibWithNibName:NEWCELLID bundle:nil] forCellReuseIdentifier:NEWCELLID];
    
    //专家榜
    [self.consultMianSummarizeTableView registerNib:[UINib nibWithNibName:EXPERTCELLID bundle:nil] forCellReuseIdentifier:EXPERTCELLID];

    //默认的类型
    _listType = ListType0;
    _topicIndex = TopicType0;
    
    //设置默认的颜色
    self.titleSegmentedControl.selectedSegmentIndex = 0;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    NSLog(@"viewwillAppear");
}

#pragma mark --UItableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSInteger number = 0;
    
    if (_listType == ListType0) {
        switch (_topicIndex) {
            case TopicType0:
                number = 10;
                break;
            case TopicType1:
                number = 5;
                break;
            default:
                break;
        }
    }else{
        number = 6;
    }
    
    return number;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cellT;

    if (_listType == ListType0) {
        switch (_topicIndex) {
            case TopicType0:
            {
                ConsultMainSummarizeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ConsultMainSummarizeCell class]) forIndexPath:indexPath];
                
              _cellHeight = [cell setBackgroundImageView:@"4.jpg" withPersonHeadImageView:@"portrait_head" withPersonNameLabel:@"何林郁" withPersonSummarizeLabel:@"单亲父母应该怎么处理孩子青春期的问题" withConsultNumerLabel:1];
                cellT = cell;
                
            }
                break;
                
            case TopicType1:
            {
                ConsultMainSummarizeCell *cell = [tableView dequeueReusableCellWithIdentifier:NEWCELLID forIndexPath:indexPath];
                [cell setPersonHeadImageView:@"portrait_head" withPersonNameNewLabel:@"名字" withPersonJobNewLabel:@"心理咨询师" withArticleTitleNewLabel:@"极客学院》全套VIP视频下载，百度网盘文章标题极客学院》全套VIP视频下载，百度网盘" withArticleSumNewLabel:@"造字工房全套（16款）正版中文设计个人字体免费下载烧脑神剧：《毛骗》终结篇回归 收费版10集完整版下载" withConsultNumberNewLabel:@"0人咨询过" withMarkNewLabel:@"心理应用"];
                cellT = cell;
            }
                break;

            default:
                break;
        }
    }
    
    if (_listType == ListType1) {
        
        ConsultMainSummarizeCell *cell = [tableView dequeueReusableCellWithIdentifier:EXPERTCELLID forIndexPath:indexPath];
        _cellHeight = 200;
        
        cellT = cell;
    }
    return cellT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  _cellHeight;
}
- (IBAction)onChangeHopTopicClicked:(id)sender {

    UISegmentedControl *segmentedControl = (UISegmentedControl*)sender;
    
    switch (segmentedControl.selectedSegmentIndex) {
        case TopicType0:
        {
            _topicIndex = TopicType0;
            [_hotTopicButton setTitleColor:[UIColor colorWithRed:0.0/255 green:122.0/255 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
            [_newestTopicButton setTitleColor:[UIColor colorWithRed:170/255 green:170/255 blue:170/225 alpha:1.0] forState:UIControlStateNormal];
        }
            break;
            
        case TopicType1:
        {
            _topicIndex = TopicType1;
            [_newestTopicButton setTitleColor:[UIColor colorWithRed:0.0/255 green:122.0/255 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
            [_hotTopicButton setTitleColor:[UIColor colorWithRed:170/255 green:170/255 blue:170/225 alpha:1.0] forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    
    [self.consultMianSummarizeTableView setNeedsDisplay];
    [self.consultMianSummarizeTableView reloadData];
}


//修改上面的标题
- (IBAction)onSegmentedControlClicked:(id)sender {
    
    UISegmentedControl *segmentedControl = (UISegmentedControl*)sender;

    if (segmentedControl.selectedSegmentIndex == 0) {
        _listType = ListType0;
        self.twoTitleView.hidden = false;
    }else{
        _listType = ListType1;
        self.twoTitleView.hidden = true;
    }
    
    [self.consultMianSummarizeTableView layoutIfNeeded];
    [self.consultMianSummarizeTableView reloadData];
}

- (IBAction)onFourTitleClicked:(id)sender {
    NSLog(@"是个标题的显示");
//    这里应该重新获取数据来尽心排列
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
    //这里可以通过获取数据进行排序是否需要进行重新获取？
    //应该重新获取数据才会合理
    
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
