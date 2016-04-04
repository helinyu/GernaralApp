//
//  MineEditProfile.m
//  PsychologyApp
//
//  Created by felix on 16/2/18.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MineEditProfile.h"
#import "EditProfileCell.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ServiceManager.h"
#import "EditProfileServiceData.h"


@interface MineEditProfile () <UITableViewDataSource,UITableViewDelegate>
{
    NSString *_personName;
    UIImage *_personImage;
    EditProfileServiceData *_profileValueS ;
}

@property (nonatomic,strong) NSArray *profiles;
@property (nonatomic,strong) NSMutableArray *profilesAttibutes;
@property (weak, nonatomic) IBOutlet UILabel *headerPersonNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *personHeaderImageView;

@end

@implementation MineEditProfile

- (void)setHeaderName:(NSString *)name withHeaderImage:(UIImage*)image {
    _personName = name;
    _personImage = image ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _profileValueS = [EditProfileServiceData new];
    
    self.profiles = @[@"昵称:",@"性别:",@"年龄:",@"地区:",@"简介:"];
    _profilesAttibutes = [NSMutableArray new];
    
//    请求数据
    [self loadEditProfile];
    
    self.personHeaderImageView.image = _personImage ;
    self.headerPersonNameLabel.text = _personName;
    
}

- (void)loadEditProfile{
    
    [OBTAIN_SERVICE(EditProfileService) requestEditProfie:_personName withComplete:^(EditProfileServiceData *serviceData, NSError *error) {
        NSLog(@"serviceData si : %@",serviceData);
        _profileValueS = serviceData;
    }];
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
    
    switch (indexPath.row) {
        case 0:
        {
            cell.valueLabel.text = _profileValueS.nickname ;
        }
            break;
        case 1:
        {
            cell.valueLabel.text = [NSString stringWithFormat:@"%d",_profileValueS.sex];
        }
            break;
        case 2:
        {
            cell.valueLabel.text = [NSString stringWithFormat:@"%ld",(long)_profileValueS.age];
        }
            break;
        case 3:
        {
            cell.valueLabel.text = _profileValueS.region;
        }
            break;
        case 4:
        {
            cell.valueLabel.text = _profileValueS.briefIntroduction;
        }
            break;
        default:
            break;
    }

    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 40;
}

#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
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



