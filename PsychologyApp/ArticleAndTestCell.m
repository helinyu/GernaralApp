//
//  ArticleAndTestCell.m
//  PsychologyApp
//
//  Created by felix on 16/2/20.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "ArticleAndTestCell.h"

#define SELFWIDTH (self.bounds.size.width - 20)

@implementation ArticleAndTestCell
{

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (CGFloat)setcellTyleNameLabel:(NSString*)cellText
             withFirstImageView:(NSString *)imageViewText
                 withTitleLabel:(NSString *)titleText
                withDetailLabel:(NSString *)detailLabelText
                  withDataLabel:(NSString *)dataLabelText{
    
    self.cellTyleNameLabel.text = cellText;
    self.firstimageView.image = [UIImage imageNamed:imageViewText];
    self.titleLabel.text = titleText;
    self.detailLabel.text = detailLabelText;
    self.dataLabel.text = dataLabelText;
    
    CGFloat cellTyleNameLabelHeight = [self getHeightFrom:cellText withFontSize:14];
    CGFloat firstImageViewHeight = 200.0;
    CGFloat titleHeight = [self getHeightFrom:titleText withFontSize:17];
    CGFloat detailHeight = [self getHeightFrom:detailLabelText withFontSize:14];
    CGFloat dataHeight = [self getHeightFrom:dataLabelText withFontSize:12];
    
    CGFloat height = cellTyleNameLabelHeight +firstImageViewHeight + titleHeight + detailHeight + dataHeight;
    
    return height;
}

- (CGFloat)getHeightFrom:(NSString*)text withFontSize:(NSInteger)fontSize {
   
   CGFloat cellHeight = [text boundingRectWithSize:CGSizeMake(SELFWIDTH, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.height;
    return cellHeight;
}


@end
