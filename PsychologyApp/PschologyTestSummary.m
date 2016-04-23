//
//  PschologyTestSummary.m
//  
//
//  Created by felix on 16/3/13.
//
//

#import "PschologyTestSummary.h"
#import "PschologyTestDetail.h"
#import "ServiceManager.h"

@interface PschologyTestSummaryCell ()
@property (weak, nonatomic) IBOutlet UILabel *cententLabel;

@end
@implementation PschologyTestSummaryCell

- (void)setcontentLabel:(NSString *)contentText{
    self.cententLabel.text = contentText;
}

@end

@interface PschologyTestSummary ()
{
    NSString * _headerTitle;
    CGFloat _headerHeight;
    
    PschologyTestSummary_ServiceData *_summaryData ;
}

@property (weak, nonatomic) IBOutlet UILabel *headerTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerContentLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *headerScrollView;

@end

@implementation PschologyTestSummary

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _summaryData = [PschologyTestSummary_ServiceData new];
    
    self.navigationItem.title = @"心理测试";
    self.headerTitleLabel.text = _headerTitle;
    
    [self loadSummaryData];
    [self setheaderViewFrame];
    
}

- (void)loadSummaryData{
    
    [OBTAIN_SERVICE(HomePageService) requestfromViewControllerPschologyTestSummaryWith:_headerTitle andComplete:^(PschologyTestSummary_ServiceData *serviceData, NSError *error) {
        if (error.code != 0 ) {
            NSLog(@"网络或者其他错误view界面");
            return ;
        }
        _summaryData = serviceData;
        NSString *text =  [(PschologyTestSummaryItem_ServiceData* )_summaryData.data[0] content];
        self.headerContentLabel.text = text;
        [self.headerContentLabel layoutIfNeeded];

    }];
}

- (void)setheaderViewFrame{
    self.headerContentLabel.backgroundColor = [UIColor grayColor];
    _headerHeight = [self.headerContentLabel.text boundingRectWithSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width - 60), 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
    [self.headerScrollView setNeedsDisplay];
}

- (void)setHeaderTitleLabelWithText:(NSString *)headerTitleText{
    _headerTitle = headerTitleText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PschologyTestSummaryCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PschologyTestSummaryCell class]) forIndexPath:indexPath];
    [cell setcontentLabel:@""];
    
    return cell;
}

- (IBAction)onBeginTestClicked:(id)sender {
    PschologyTestDetail *testDetail = [[UIStoryboard storyboardWithName:@"HomePage" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([PschologyTestDetail class])];
    testDetail.paramTitle = _headerTitle;
    [self.navigationController pushViewController:testDetail animated:true];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  56;
}

@end
