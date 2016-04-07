//
//  ReadingService.h
//  PsychologyApp
//
//  Created by felix on 16/4/7.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Service.h"
#import "MarriageLoveServiceData.h"

@interface ReadingService : Service

- (void)requestMarriageLove:(NSInteger)category_id withOffset:(NSInteger)offset withLimit:(NSInteger)limit withComplete:(void (^)(NSData *data,NSError *error))completeBlock;

@end
