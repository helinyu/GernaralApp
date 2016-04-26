//
//  PschologyTestDetailCellTableViewCell.m
//  PsychologyApp
//
//  Created by felix on 16/4/23.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "PschologyTestDetailCell.h"

@interface PschologyTestDetailCell()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *choiceBtn;
@property (strong,nonatomic) FLIndexPath *indexPath;
@end

@implementation PschologyTestDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCellOfDescription:(NSString*)description withNSIndexPath:(FLIndexPath*)indexpath{
    
    if (indexpath.hasChoice == true) {
        [self.choiceBtn setImage:[UIImage imageNamed:@"has_choice"] forState:UIControlStateNormal];
    }else{
        [self.choiceBtn setImage:[UIImage imageNamed:@"no_choice"] forState:UIControlStateNormal];
    }
    self.descriptionLabel.text = description;
    self.indexPath = indexpath;
}

- (IBAction)onChooseClicked:(id)sender {
    NSLog(@" PschologyTestDetailCell clicked");
    [self.detailCellDelegate hasClickedCellBtnIndex:self.indexPath];
}

@end
