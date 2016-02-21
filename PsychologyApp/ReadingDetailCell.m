//
//  ReadingDetailCell.m
//  PsychologyApp
//
//  Created by felix on 16/2/21.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "ReadingDetailCell.h"

@interface ReadingDetailCell ()

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellWidthConstraint;

@end

@implementation ReadingDetailCell

- (void)awakeFromNib {
    
}

- (void)setLeftImageView:(NSString *)leftImageText
          withTitleLabel:(NSString*)titleText
         withDetailLabel:(NSString*)detailText
         withNumberLabel:(NSInteger)number{

    //设置cell的高度
    self.cellWidthConstraint.constant = [UIScreen mainScreen].bounds.size.width;
    
    self.leftImageView.image = [UIImage imageNamed:leftImageText];
    self.titleLabel.text = titleText;
    self.detailLabel.text = detailText;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",number];
}

@end
