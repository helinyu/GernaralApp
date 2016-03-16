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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerContentHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerHeightConstraint;
@property (weak, nonatomic) IBOutlet UIScrollView *headerScrollView;

@end

@implementation PschologyTestSummary

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _summaryData = [PschologyTestSummary_ServiceData new];
    
    self.navigationItem.title = @"心理测试";
    self.headerTitleLabel.text = _headerTitle;
    
    [self loadSummaryData];
    
#warning 这个方法要在设置文字的后面
    [self setheaderViewFrame];
    
}

- (void)loadSummaryData{
    [OBTAIN_SERVICE(HomePageService) requestfromViewControllerPschologyTestSummary:^(PschologyTestSummary_ServiceData *serviceData, NSError *error) {
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
    self.headerContentLabel.backgroundColor = [UIColor blueColor];
    _headerHeight = [self.headerContentLabel.text boundingRectWithSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width - 60), 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
    self.headerContentHeightConstraint.constant = _headerHeight;
    self.headerHeightConstraint.constant = 114 + _headerHeight;
    self.headerScrollView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, self.headerHeightConstraint.constant);
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
    [cell setcontentLabel:@"测试职工的"];
    
    return cell;
}

- (IBAction)onBeginTestClicked:(id)sender {
    NSLog(@"开始测试");
    PschologyTestDetail *testDetail = [[UIStoryboard storyboardWithName:@"HomePage" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([PschologyTestDetail class])];
    [self.navigationController pushViewController:testDetail animated:true];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return  56;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
