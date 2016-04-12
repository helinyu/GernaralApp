//
//  TopicServiceData.h
//  PsychologyApp
//
//  Created by felix on 16/4/11.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"

//话题
@protocol TopicItemServiceData <NSObject>
@end
@interface TopicItemServiceData : ServiceData
@property (nonatomic,assign) NSInteger topic_id;
@property (nonatomic,strong) NSString *theme;
@property (nonatomic,strong) NSString *owner;
@property (nonatomic,strong) NSString *location;
@property (nonatomic,assign) NSInteger commentsNum;
@property (nonatomic,assign) NSInteger praiseNum;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *headerImageUrl;
@end

@interface TopicServiceData : ServiceData
@property (nonatomic,assign) NSInteger number;
@property (nonatomic,strong) NSMutableArray <TopicItemServiceData>* topics;
@end

//评论
@protocol commentItemServiceData <NSObject>
@end
@interface commentItemServiceData : ServiceData
@property (nonatomic,strong) NSString *content;
@end
@interface CommentsServiceData : ServiceData
@property (nonatomic,assign) NSInteger number;
@property (nonatomic,strong) NSMutableArray<commentItemServiceData> *datas;
@end

//创建评论的结果
@interface CommentsCreationServiceData: ServiceData
@property (nonatomic,assign) NSInteger ret;
@end

@interface  TopicCommentsServiceData: ServiceData
@property (nonatomic,strong) NSString *content;
@end
