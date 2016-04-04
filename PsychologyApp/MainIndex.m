//
//  MainIndex.m
//  PsychologyApp
//
//  Created by felix on 16/2/19.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MainIndex.h"
#import <Crashlytics/Crashlytics.h>
#import "ServiceManager.h"
#import "MineSetting.h"

@interface MainIndex ()

@property (nonatomic,copy) NSString *link;
@property (nonatomic,assign) BOOL isClicked;

@end

@implementation MainIndex

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    检查更新
    [[MineSetting new] onCheckUpdateClicked:nil];
        
    if (self.isClicked) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.link]];
    }
}



- (void)setADLink:(NSString *)link with:(BOOL)isClicked {
    self.link = link;
    self.isClicked = isClicked;
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
