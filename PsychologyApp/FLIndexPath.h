//
//  FLIndexPath.h
//  PsychologyApp
//
//  Created by felix on 16/4/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FLIndexPath <NSObject>
@end

@interface FLIndexPath : NSObject
@property (nonatomic,strong) NSIndexPath *indexPath;
@property (nonatomic,assign) BOOL hasChoice;
@end
