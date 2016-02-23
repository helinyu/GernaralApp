//
//  MainConsult.m
//  PsychologyApp
//
//  Created by felix on 16/2/19.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MainConsult.h"
#import "ReadingTitleLabelCell.h"
#import "ConsultMainSummarizeCell.h"

typedef NS_ENUM(NSInteger, TopicType) {
    TopicType1 = 0,
    TopicType2
};


#define HOTCELLID NSStringFromClass([ConsultMainSummarizeCell class])
#define NEWCELLID @"ConsultNewTopicCell"

@interface MainConsult () <UITableViewDataSource,UITableViewDelegate>
{
    NSInteger _topicIndex;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *titleswitchControl;
@property (weak, nonatomic) IBOutlet UITableView *consultMianSummarizeTableView;
@property (weak, nonatomic) IBOutlet UIButton *hotTopicButton;
@property (weak, nonatomic) IBOutlet UIButton *newestTopicButton;

@end

@implementation MainConsult

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //tableView 注册cell  r热门话题
    [self.consultMianSummarizeTableView registerNib:[UINib nibWithNibName:HOTCELLID bundle:nil] forCellReuseIdentifier:HOTCELLID];
    
    //最新话题
    [self.consultMianSummarizeTableView registerNib:[UINib nibWithNibName:NEWCELLID bundle:nil] forCellReuseIdentifier:NEWCELLID];

    //默认的类型
    _topicIndex = TopicType1;
}

#pragma mark --UItableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger number;
    
    switch (_topicIndex) {
        case TopicType1:
            number = 10;
            break;
        case TopicType2:
            number = 5;
            break;
        default:
            break;
    }
    return number;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cellT;
    
    switch (_topicIndex) {
        case TopicType1:
        {
            ConsultMainSummarizeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ConsultMainSummarizeCell class]) forIndexPath:indexPath];
            
            [cell setBackgroundImageView:@"4.jpg" withPersonHeadImageView:@"portrait_head" withPersonNameLabel:@"何林郁" withPersonSummarizeLabel:@"单亲父母应该怎么处理孩子青春期的问题" withConsultNumerLabel:1];
            cellT = cell;

        }
            break;
            
        case TopicType2:
        {
            ConsultMainSummarizeCell *cell = [tableView dequeueReusableCellWithIdentifier:NEWCELLID forIndexPath:indexPath];
            [cell setPersonHeadImageView:@"portrait_head" withPersonNameNewLabel:@"名字" withPersonJobNewLabel:@"心理咨询师" withArticleTitleNewLabel:@"极客学院》全套VIP视频下载，百度网盘文章标题极客学院》全套VIP视频下载，百度网盘" withArticleSumNewLabel:@"造字工房全套（16款）正版中文设计个人字体免费下载烧脑神剧：《毛骗》终结篇回归 收费版10集完整版下载" withConsultNumberNewLabel:@"0人咨询过" withMarkNewLabel:@"心理应用"];
            cellT = cell;
        }
            break;
            
              default:
            break;
    }
    return cellT;
}

- (IBAction)onChangeHopTopicClicked:(id)sender {
    NSLog(@"切换了按钮");
    
    UIButton *button = (UIButton*)sender ;
    switch (button.tag-20) {
        case TopicType1:
        {
            _topicIndex = TopicType1;
            [_hotTopicButton setTitleColor:[UIColor colorWithRed:0.0/255 green:122.0/255 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
            [_newestTopicButton setTitleColor:[UIColor colorWithRed:170/255 green:170/255 blue:170/225 alpha:1.0] forState:UIControlStateNormal];
        }
            break;
            
        case TopicType2:
        {
            _topicIndex = TopicType2;
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
