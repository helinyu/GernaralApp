//
//  ConsultMainSummarizeCell.m
//  PsychologyApp
//
//  Created by felix on 16/2/22.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "ConsultMainSummarizeCell.h"


@interface ConsultMainSummarizeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *personHeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *personNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *personSummarizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *consultNumerLabel;


@end

@implementation ConsultMainSummarizeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setBackgroundImageView:(NSString *)backgroundImageViewText withPersonHeadImageView:(NSString *)personHeadImageViewText withPersonNameLabel:(NSString *)personNameLabelText withPersonSummarizeLabel:(NSString *)personSummarizeLabelText withConsultNumerLabel:(NSInteger)consultNumber{
    self.backgroundImageView.image = [UIImage imageNamed:backgroundImageViewText];
    self.personHeadImageView.image = [UIImage imageNamed:personHeadImageViewText];
    self.personNameLabel.text = personNameLabelText;
    self.personSummarizeLabel.text = personSummarizeLabelText;
    self.consultNumerLabel.text = [NSString stringWithFormat:@"%ld人咨询过",consultNumber];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
