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
#import "MineSetting.h"
#import "MineFeedback.h"
#import "MineShareFriend.h"
#import "MineAttentionOrFan.h"

#import "MineEditProfile.h"
#import "MineConsultingexpert.h"

#import "MineCollection.h"
#import "MineTest.h"
#import "MineQA.h"
#import "MineArticle.h"

#import "MineBookingManagement.h"
#import "MineMessageCenter.h"


@interface MineController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_arrays;
}

@end

@implementation MineController


- (void)viewDidLoad{
    _arrays = @[
               @[@"消息中心",@"预约管理"],
               @[@"文章",@"问答",@"测试",@"收藏"],
               @[@"编辑资料",@"专家注入"],
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
            //第一段的分类
            switch (indexPath.row) {
                case 0:
                    NSLog(@"第一段的第一行");
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineBookingManagement class])] animated:YES];
                    break;
                case 1:
                    NSLog(@"第一段的第一行");
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineMessageCenter class])] animated:YES];
                    break;
    
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineCollection class])] animated:YES];
                    break;
                }
                    
                case 1:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineTest class])] animated:YES];
                    break;
                }
                    
                case 2:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineQA class])] animated:YES];
                    break;
                }
                    
                case 3:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineArticle class])] animated:YES];
                    break;
                }
                default:
                    break;
            }
            break;
            
        case 2:
            switch (indexPath.row) {
                case 0:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineAttentionOrFan class])] animated:YES];
                    break;
                }
                case 1:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineShareFriend class])] animated:YES];
                    break;
                }
                default:
                    break;
            }
            break;
            
        case 3:
            switch (indexPath.row) {
                case 0:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineAttentionOrFan class])] animated:YES];
                    break;
                }

                case 1:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineShareFriend class])] animated:YES];
                    break;
                }

                case 2:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineFeedback class])] animated:YES];
                    break;
                }

                case 3:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineSetting class])] animated:YES];
                    break;
                }
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
