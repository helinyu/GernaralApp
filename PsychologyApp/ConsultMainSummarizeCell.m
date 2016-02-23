//
//  ConsultMainSummarizeCell.m
//  PsychologyApp
//
//  Created by felix on 16/2/22.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "ConsultMainSummarizeCell.h"


@interface ConsultMainSummarizeCell ()

#pragma mark -- hotTopic
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *personHeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *personNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *personSummarizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *consultNumerLabel;

#pragma mark --newtopic
@property (weak, nonatomic) IBOutlet UIImageView *personHotNewLabel;
@property (weak, nonatomic) IBOutlet UILabel *personNameNewLabel;
@property (weak, nonatomic) IBOutlet UILabel *personJobNewLabel;
@property (weak, nonatomic) IBOutlet UILabel *articleTitleNewLabel;
@property (weak, nonatomic) IBOutlet UILabel *articleSumNewLabel;
@property (weak, nonatomic) IBOutlet UILabel *consultNumberNewLabel;
@property (weak, nonatomic) IBOutlet UILabel *markNewLabel;

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

//#pragma mark newtopic
//@property (weak, nonatomic) IBOutlet UIImageView *personHotNewLabel;
//@property (weak, nonatomic) IBOutlet UILabel *personNameNewLabel;
//@property (weak, nonatomic) IBOutlet UILabel *personJobNewLabel;
//@property (weak, nonatomic) IBOutlet UILabel *articleTitleNewLabel;
//@property (weak, nonatomic) IBOutlet UILabel *articleSumNewLabel;
//@property (weak, nonatomic) IBOutlet UILabel *consultNumberNewLabel;
//@property (weak, nonatomic) IBOutlet UILabel *markNewLabel;

- (void)setPersonHeadImageView:(NSString *)personHeadImageViewText
        withPersonNameNewLabel:(NSString*)personNameNewLabelText
         withPersonJobNewLabel:(NSString*)personJobNewLabelText
      withArticleTitleNewLabel:(NSString *)articleTitleNewLabelText
        withArticleSumNewLabel:(NSString *)articleSumNewLabelText
     withConsultNumberNewLabel:(NSString *)consultNumberNewLabelText
              withMarkNewLabel:(NSString *)markNewLabelText{
    
    self.personHeadImageView.image = [UIImage imageNamed:personHeadImageViewText];
    self.personNameNewLabel.text = personNameNewLabelText;
    self.personJobNewLabel.text  = personJobNewLabelText;
    self.articleTitleNewLabel.text = articleTitleNewLabelText;
    self.articleSumNewLabel.text = articleSumNewLabelText;
    self.consultNumberNewLabel.text = consultNumberNewLabelText;
    self.markNewLabel.text = markNewLabelText;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
