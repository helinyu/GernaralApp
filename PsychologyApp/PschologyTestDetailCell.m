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
@end

@implementation PschologyTestDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCellOfDescription:(NSString*)description{
    self.descriptionLabel.text = description;
}

- (IBAction)onChooseClicked:(id)sender {
    NSLog(@"clicked");
    [self.choiceBtn setImage:[UIImage imageNamed:@"has_choice"] forState:UIControlStateNormal];
}

@end
