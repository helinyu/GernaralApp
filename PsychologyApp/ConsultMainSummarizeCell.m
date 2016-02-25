//
//  ConsultMainSummarizeCell.m
//  PsychologyApp
//
//  Created by felix on 16/2/22.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "ConsultMainSummarizeCell.h"

#define SELFWIDTH (self.bounds.size.width - 20)

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

#pragma mark -- expert



@end

@implementation ConsultMainSummarizeCell

- (void)awakeFromNib {
}

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.frame.size.width = [UIScreen mainScreen].bounds.size.width;
    }
    return self;
}

//hot Detail
- (CGFloat)setBackgroundImageView:(NSString *)backgroundImageViewText withPersonHeadImageView:(NSString *)personHeadImageViewText withPersonNameLabel:(NSString *)personNameLabelText withPersonSummarizeLabel:(NSString *)personSummarizeLabelText withConsultNumerLabel:(NSInteger)consultNumber{
   
    self.backgroundImageView.image = [UIImage imageNamed:backgroundImageViewText];
    self.personHeadImageView.image = [UIImage imageNamed:personHeadImageViewText];
    self.personNameLabel.text = personNameLabelText;
    self.personSummarizeLabel.text = personSummarizeLabelText;
    self.consultNumerLabel.text = [NSString stringWithFormat:@"%ld人咨询过",consultNumber];

    return 150.0;
}

//new topic
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

//专家
//- (CGFloat)setPersonHeadExpertImageView:(NSString*)personHeadExpertImageViewText
//              withPersonNameExpertLabel:(NSString *)personNameExpertText
//             withPersonMottoDetailLabel:(NSString*)personMottoDetailText
//         withPersonSummarizeDetailLabel:(NSString*)personSummarizeDetailText
//     withPersonConsultNumberDateilLabel:(NSString*)personConsultNumberDateilText
//            withPersonPraiseExpertLabel:(NSString*)personPraiseExpertText{
//    
//    self.personHeadExpertImageView.image = [UIImage imageNamed:personHeadExpertImageViewText];
//    self.personNameExpertLabel.text = personNameExpertText;
//    self.personMottoDetailLabel.text = personMottoDetailText;
//    self.personSummarizeDetailLabel.text = personSummarizeDetailText;
//    self.personConsultNumberDateilLabel.text = personConsultNumberDateilText;
//    self.personNameExpertLabel.text = personNameExpertText;
//    
//    CGFloat nameHeight = [self getHeightFrom:personNameExpertText withFontSize:16];
//    CGFloat mottoHeight = [self getHeightFrom:personMottoDetailText withFontSize:14];
//    CGFloat numberHeight = [self getHeightFrom:personMottoDetailText withFontSize:12];
//
//    return  nameHeight + mottoHeight + numberHeight + 145;
//}


- (CGFloat)getHeightFrom:(NSString*)text withFontSize:(NSInteger)fontSize {
    
    CGFloat cellHeight = [text boundingRectWithSize:CGSizeMake(SELFWIDTH, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.height;
    
    return cellHeight;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
