//
//  MineController.m
//  PsychologyApp
//
//  Created by felix on 16/1/13.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MineController.h"
#import "FLTableViewCell.h"
#import "AccountLogin.h"

@interface MineController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_arrays;
}

@end

@implementation MineController


- (void)viewDidLoad{
    _arrays = @[@[@"消息中心",@"预约管理"],
                       @[@"文章",@"问答",@"测试",@"收藏"],
                       @[@"关注/粉丝",@"分享好友",@"反馈意见",@"设置"]
                       ];
    NSLog(@"coutn is : %ld",_arrays.count);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}


#pragma mark --tableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrays[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _arrays.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FLTableViewCell class]) forIndexPath:indexPath];
    
    [cell cellWithImage:[UIImage imageNamed:@"icon_timeOfAppointment"] andGeneralizatonWithtext:_arrays[indexPath.section][indexPath.row]];
    return cell;
}


#pragma mark --tableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    NSLog(@"第一段的第一行");
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Account" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([AccountLogin class])] animated:YES];
                    break;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
}



- (IBAction)onAccountLoginTap:(id)sender {
    
    NSLog(@"accountLogin");
    AccountLogin *accountLogin = [[UIStoryboard storyboardWithName:@"Account" bundle:nil]instantiateViewControllerWithIdentifier:NSStringFromClass([AccountLogin class])];
    [self.navigationController pushViewController:accountLogin animated:YES];
    
}


@end
