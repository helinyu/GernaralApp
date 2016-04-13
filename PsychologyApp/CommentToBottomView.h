//
//  CommentToBottomView.h
//  test
//
//  Created by felix on 16/4/13.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CommentToBottomViewDelegate <NSObject>
@required
-(void)deliverTextViewText:(NSString*) textviewText;
@end

@interface CommentToBottomView : UIView

@property (weak,nonatomic) IBOutlet id<CommentToBottomViewDelegate> commentDelegate;


@end
