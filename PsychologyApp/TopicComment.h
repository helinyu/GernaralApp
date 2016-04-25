//
//  TopicComment.h
//  PsychologyApp
//
//  Created by felix on 16/4/10.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicServiceData.h"


@protocol TopicCommentDelegate <NSObject>

- (void)freshCommentsNumber:(NSInteger)praiseNum;

@end

@interface TopicComment : UIViewController

@property (nonatomic,strong) TopicItemServiceData *personServiceData;
@property (nonatomic,weak) id<TopicCommentDelegate> topicCommmetDelegate;

@end
