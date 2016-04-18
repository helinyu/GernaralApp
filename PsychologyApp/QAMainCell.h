//
//  QAMainCell.h
//  PsychologyApp
//
//  Created by felix on 16/2/21.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol QAMainCellDelegate <NSObject>
@optional
- (void)hasCommentClicked:(NSInteger )index;
- (void)hasPraseClicked:(NSInteger) praseNumber withTopic_id:(NSInteger)topic_id;
@end

@interface QAMainCell : UITableViewCell

@property (nonatomic,weak,nullable) id<QAMainCellDelegate> mainCellDelegate;

- (CGFloat)setHeaderImageViewText:(NSString*)headerImageText withTittleText:(NSString *)titleText withTimeText:(NSString *)timeText  withMainTopicText:(NSString *)themeText withLocationText:(NSString *)locationText withPriceBtn:(NSInteger)priseNum withCommentsIndex:(NSInteger)commentsIndex;
@end
