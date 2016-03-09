//
//  MineMessageCenter.m
//  PsychologyApp
//
//  Created by felix on 16/2/18.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MineMessageCenter.h"

@interface MineMessageCenter ()

@property (nonatomic,strong) NSArray * informations;
@property (nonatomic,strong) NSArray * images;

@end

@implementation MineMessageCenter

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _informations = @[@"消息",@"评论",@"系统通知"];
    _images = @[@"icon_information",@"icon_text_message",@"icon_system_information"];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _informations.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //为什么使用官方的时候使用下面的方法不可以呢？
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableView" forIndexPath:indexPath];

    static NSString *identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:identifier];
//        cell.selectionStyle =UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [_informations objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:_images[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
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
