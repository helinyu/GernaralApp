//
//  QAMainCell.h
//  PsychologyApp
//
//  Created by felix on 16/2/21.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QAMainCell : UITableViewCell

- (CGFloat)setTitleTextLabel:(NSString *)titleText
               withTimeLabel:(NSString *)timeText
        withTextContentLabel:(NSString *)textContentText
        withTypeConsultLabel:(NSString *)typeConsultText
         withNumberTextLabel:(NSInteger )number;

@end
