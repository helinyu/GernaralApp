//
//  PschologyTestResult.m
//  PsychologyApp
//
//  Created by felix on 16/4/23.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "PschologyTestResult.h"
#import "ServiceManager.h"


@interface PschologyTestResult ()
@property (weak, nonatomic) IBOutlet UILabel *resultTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;
@end

@implementation PschologyTestResult

- (void)viewDidLoad{
    [super viewDidLoad];
    [self loadData];
}

- (void)loadData{
    [OBTAIN_SERVICE(HomePageService) requestResultWithtitle:@"亲少年心理问题" WithComplete:^(PschologyTestResultServiceData *serviceData, NSError *error) {
        self.resultTitleLabel.text = serviceData.result_title;
        self.resultTextView.text = serviceData.result_text;
    }];
}

- (IBAction)onTapGestureClicked:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:true];
}

@end
