//
//  ConsultMainSummarizeCell.h
//  PsychologyApp
//
//  Created by felix on 16/2/22.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsultMainSummarizeCell : UITableViewCell

- (void)setBackgroundImageView:(NSString *)backgroundImageViewText withPersonHeadImageView:(NSString *)personHeadImageViewText withPersonNameLabel:(NSString *)personNameLabelText withPersonSummarizeLabel:(NSString *)personSummarizeLabelText withConsultNumerLabel:(NSInteger)consultNumber;

@end