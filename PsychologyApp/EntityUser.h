//
//  EntityUser.h
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Entity.h"

@interface EntityUser : Entity

@property (assign, nonatomic) BOOL isLogined;
@property (strong, nonatomic) NSString* uId;

@end
