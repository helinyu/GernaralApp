//
//  MineEditProfile.m
//  PsychologyApp
//
//  Created by felix on 16/2/18.
//  Copyright © 2016年 felix. All rights reserved.
//




#import "MineEditProfile.h"
#import "EditProfileCell.h"

@interface MineEditProfile () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *profiles;


@end

@implementation MineEditProfile

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.profiles = @[@"昵称",@"性别",@"年龄",@"地区",@"简介"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -- 修改资料

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.profiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    EditProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EditProfileCell class]) forIndexPath:indexPath];
    cell.atrributeLabel.text = self.profiles[indexPath.row];
    cell.valueLabel.text  = self.profiles[indexPath.row];
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 40;
}

#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        default:
            break;
    }
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



