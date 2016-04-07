//
//  ReadingDetailCell.m
//  PsychologyApp
//
//  Created by felix on 16/2/21.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "ReadingDetailCell.h"
#import "UIImageView+WebRequest.h"

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
         withNumberLabel:(NSString*)number{

    //设置cell的高度
    self.cellWidthConstraint.constant = [UIScreen mainScreen].bounds.size.width;
    
//    self.leftImageView.image = [UIImage imageNamed:leftImageText];
    [self.leftImageView setImageWithAbsoluteUrlStr:leftImageText];
    self.titleLabel.text = titleText;
    self.detailLabel.text = detailText;
    self.numberLabel.text = number;
}

@end
