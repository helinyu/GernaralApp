//
//  ArticleAndTestCell.h
//  PsychologyApp
//
//  Created by felix on 16/2/20.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleAndTestCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellTyleNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *firstimageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

- (CGFloat)setcellTyleNameLabel:(NSString*)cellText
             withFirstImageView:(NSString *)imageViewText
                 withTitleLabel:(NSString *)titleText
                withDetailLabel:(NSString *)detailLabelText
                  withDataLabel:(NSString *)dataLabelText;

@end
