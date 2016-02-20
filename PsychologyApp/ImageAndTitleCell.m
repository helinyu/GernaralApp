//
//  ImageAndTitleCell.m
//  PsychologyApp
//
//  Created by felix on 16/2/20.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "ImageAndTitleCell.h"

@implementation ImageAndTitleCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self layoutIfNeeded];
}

- (void)setImageTitle:(NSString *)imageTitleText andTextTitle:(NSString *) textTitle{
    UIImage *img = [UIImage imageNamed:imageTitleText];
    self.imageView.image = img;
    self.textTitlte.text = textTitle;
}

@end
