//
//  Model.m
//  PsychologyApp
//
//  Created by felix on 16/3/9.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Model.h"
#import <sqlite3.h>
#define MODEL_VERSION_CURRENT 0

@interface Model ()
{
    sqlite3 *_db;
    
}

@end

@implementation Model

+ (instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static Model *thiz;

    dispatch_once(&once, ^{
            thiz = [self new];
        });
    return thiz;
}

- (instancetype)init{
    self = [super init];
    if (self){
        [self _initStorage];
//        [self loadUser];
    }
    return self;
}

#pragma mark - Private Functions
- (void)_initStorage {
    const char* dbPath = [[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"models.sqlite"] UTF8String];
    sqlite3_open(dbPath, &_db);
    sqlite3_exec(_db, "CREATE TABLE IF NOT EXISTS o_users(`uid` CHAR(32) NOT NULL DEFAULT '' PRIMARY KEY, `data` MEDIUMBLOB)", NULL, NULL, NULL);
//    sqlite3_close(_db);
}

#pragma mark --user
- (EntityUser*)loadUseByUId:(NSString *)uId{
    self.user = [EntityUser new];
    self.user.uId = uId ;
//    if(self.app.loginedUid.length > 0) {
        sqlite3_stmt *stmt = NULL;
        const char* sql = "SELECT `data` FROM o_users WHERE `uid`=?";
        sqlite3_prepare_v2(_db, sql, (int)strlen(sql), &stmt, NULL);
        sqlite3_bind_text(stmt, 1, [self.user.uId UTF8String], -1, SQLITE_TRANSIENT);
    
    if(SQLITE_ROW == sqlite3_step(stmt)){
            NSData *data = [NSData dataWithBytes:sqlite3_column_blob(stmt, 0) length:sqlite3_column_bytes(stmt, 0)];
            NSError *error = nil;
            @try {
                EntityUser *user = [[EntityUser alloc] initWithData:data error:&error];
                if(error != nil) {
                    NSLog(@"user data corrupted");
                }
                else {
                    self.user = user;
                }
            }
            @catch (NSException *exception) {
                NSLog(@"user data corrupted");
            }
        }
        sqlite3_finalize(stmt);
//    }
    if(self.user == nil) {
        self.user = [EntityUser new];
    }
    return self.user;
}

- (void)commitUser{
    
    NSString *data = [self.user toJSONString];
    NSLog(@"dataJson is : %@",data);
    sqlite3_stmt *stmt = NULL;
    const char* sql = "REPLACE INTO o_users(`uid`, `data`) VALUES(?,?)";
    sqlite3_prepare_v2(_db, sql, (int)strlen(sql), &stmt, NULL);
    sqlite3_bind_text(stmt, 1, [self.user.uId UTF8String], (int)strlen([self.user.uId UTF8String]), SQLITE_TRANSIENT);
    sqlite3_bind_blob(stmt, 2, [data UTF8String], (int)strlen([data UTF8String]), SQLITE_TRANSIENT);
    sqlite3_step(stmt);
    sqlite3_finalize(stmt);
}

@end
