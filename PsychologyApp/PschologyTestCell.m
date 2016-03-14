//
//  PschologyTestCell.m
//  PsychologyApp
//
//  Created by felix on 16/3/13.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "PschologyTestCell.h"

@interface PschologyTestCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;
@property (weak, nonatomic) IBOutlet UILabel *testNumberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *commentImageView;
@property (weak, nonatomic) IBOutlet UILabel *commentNumberLabel;

@end

@implementation PschologyTestCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHeaderImageView:(NSString *)headerImageViewText withTittleLabel:(NSString *)titleLabelText withTestImageView:(NSString *)testImageViewText withTestNumberLabel:(NSString *)testNumberLabelText withCommentImageView:(NSString *)commentImageViewText withCommentNumberLabelText:(NSString *) commentNumberLabelTest{
  
    self.headerImageView.image = [UIImage imageNamed:headerImageViewText];
    self.titleLabel.text = titleLabelText;
    self.testImageView.image = [UIImage imageNamed:testImageViewText];
    self.testNumberLabel.text = testNumberLabelText;
    self.commentImageView.image = [UIImage imageNamed:commentImageViewText];
    self.commentNumberLabel.text = commentNumberLabelTest;
}

@end
