//
//  QAMainCell.m
//  PsychologyApp
//
//  Created by felix on 16/2/21.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "QAMainCell.h"
#import "UIImageView+WebCache.h"

#define SELFWIDTH (self.bounds.size.width - 20)

#define Except_ThemeLabelHeight 120.0


@interface QAMainCell (){
    NSInteger _commentsIndex;
}
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainTopicLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIButton *praiseBtn;
@property (weak, nonatomic) IBOutlet UIButton *commontsBtn;

@end

@implementation QAMainCell

- (void)awakeFromNib {
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (CGFloat)setHeaderImageViewText:(NSString *)headerImageText withTittleText:(NSString *)titleText withTimeText:(NSString *)timeText  withMainTopicText:(NSString *)themeText withLocationText:(NSString *)locationText withPriceBtn:(NSInteger)priseNum withComments:(NSInteger)commentsNum withCommentsIndex:(NSInteger)commentsIndex{
   [ _headerImageView sd_setImageWithURL:[NSURL URLWithString:headerImageText] placeholderImage:[UIImage imageNamed:@"image_default"]];
    _titleTextLabel.text = titleText;
    _timeLabel.text = timeText;
    _mainTopicLabel.text = themeText;
    _locationLabel.text = locationText;
    [_praiseBtn setTitle:[NSString stringWithFormat:@"%ld",priseNum] forState:UIControlStateNormal];
    [_commontsBtn setTitle:[NSString stringWithFormat:@"%ld",commentsNum] forState:UIControlStateNormal];
//    主题是可以有两行的
    CGFloat themeHeight = [self getHeightFrom:themeText withFontSize:16];
    _commentsIndex = commentsIndex;
    return  themeHeight + Except_ThemeLabelHeight;
    
}

- (CGFloat)getHeightFrom:(NSString*)text withFontSize:(NSInteger)fontSize {
    CGFloat cellHeight = [text boundingRectWithSize:CGSizeMake(SELFWIDTH, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.height;
    return cellHeight;
}

- (IBAction)onPraiseClicked:(id)sender {
    NSLog(@"点赞");
}

- (IBAction)onCommentClicked:(id)sender {
    NSLog(@"评论");
    [self.mainCellDelegate hasCommentClicked:_commentsIndex];
}

@end
