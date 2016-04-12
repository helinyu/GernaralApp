//
//  CommentsCell.h
//  PsychologyApp
//
//  Created by felix on 16/4/12.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsCell : UITableViewCell

@property (nonatomic,strong) NSString * headerViewUrl ;
@property (nonatomic,strong) NSString * ownerName;
@property (nonatomic,strong) NSString * time;
@property (nonatomic,assign) NSInteger praiseNum;

@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;

@end
