//
//  RestStructResponse.h
//  PsychologyApp
//
//  Created by felix on 16/2/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RestStructResponse : JSONModel

@end


@interface RestStructRegisterResponse : RestStructResponse

@property (assign ,nonatomic) NSInteger ret;

@end