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
@required
- (void)hasCommentClicked:(NSInteger )index;
@end

@interface QAMainCell : UITableViewCell

@property (nonatomic,weak,nullable) id<QAMainCellDelegate> mainCellDelegate;

- (CGFloat)setHeaderImageViewText:(NSString*)headerImageText withTittleText:(NSString *)titleText withTimeText:(NSString*)timeText  withMainTopicText:(NSString *)themeText withLocationText:(NSString *)locationText withPriceBtn:(NSInteger)priseNum withComments:(NSInteger)commentsNum withCommentsIndex:(NSInteger)commentsIndex;
@end
