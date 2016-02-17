//
//  RestStructRequest.h
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface RestStructRequest : NSObject

@property (strong, nonatomic) NSMutableDictionary *params;
- (NSData *) toPostBody;

@end

@interface RestStructRegisterByPhoneRequest : RestStructRequest
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *password;
@end

@interface RestStructLoginByPhoneRequest : RestStructRequest
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *password;
@end