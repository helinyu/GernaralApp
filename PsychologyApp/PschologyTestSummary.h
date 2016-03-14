//
//  PschologyTestSummary.h
//  
//
//  Created by felix on 16/3/13.
//
//

#import <UIKit/UIKit.h>

@interface PschologyTestSummary : UITableViewController

- (void)setHeaderTitleLabelWithText:(NSString *)headerTitleText;

@end

@interface PschologyTestSummaryCell : UITableViewCell
- (void)setcontentLabel:(NSString *)contentText;
@end
