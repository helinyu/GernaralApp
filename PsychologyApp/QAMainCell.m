//
//  QAMainCell.m
//  PsychologyApp
//
//  Created by felix on 16/2/21.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "QAMainCell.h"


#define SELFWIDTH (self.bounds.size.width - 20)

@interface QAMainCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textContentLabelConstraint;

@property (weak, nonatomic) IBOutlet UILabel *titleTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *textContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeConsultLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberTextLabel;

@end

@implementation QAMainCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (CGFloat)setTitleTextLabel:(NSString *)titleText
               withTimeLabel:(NSString *)timeText
        withTextContentLabel:(NSString *)textContentText
        withTypeConsultLabel:(NSString *)typeConsultText
         withNumberTextLabel:(NSInteger )number{
    
    self.titleTextLabel.text = titleText;
    self.timeLabel.text = timeText;
    self.textContentLabel.text = textContentText;
    self.typeConsultLabel.text = typeConsultText;
    self.numberTextLabel.text = [NSString stringWithFormat:@"%ld",number];
    
    _textContentLabelConstraint.constant = [self getHeightFrom:textContentText withFontSize:number];
    
    return _textContentLabelConstraint.constant+90;
}

- (CGFloat)getHeightFrom:(NSString*)text withFontSize:(NSInteger)fontSize {
    
    CGFloat cellHeight = [text boundingRectWithSize:CGSizeMake(SELFWIDTH, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.height;
    return cellHeight;
}

@end
