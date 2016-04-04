//
//  NSString+Highlight.m
//  guimiquan
//
//  Created by Jesse Ou on 14-10-13.
//  Copyright (c) 2014年 Vanchu. All rights reserved.
//s
#import <Foundation/Foundation.h>

@interface NSString (Helper)

- (void)makeRangeWithString:(NSString *)mstr withKeyword:(NSString *)search withRangeArray:(NSMutableArray *)rangeArray;
- (NSMutableArray *)highlightRangeArrayWithKeywords:(NSArray *)keywords;
- (NSMutableArray *)highlightAttributeStrWithKeywords:(NSArray *)keywords;
- (NSString *)highlightWithKeywords:(NSArray *)keywords;
- (NSString *)substringCaptureInRange:(NSRange)range;
- (NSString *)substringCaptureFromIndex:(NSUInteger)from;
- (NSString *)substringCaptureToIndex:(NSUInteger)to;
- (NSString *)urlEncode;
- (NSString *)urlDecode;
- (NSString *)urlEncodeAll;
- (NSArray *)componentsSeparatedByString:(NSString *)separator limit:(NSUInteger)limit;

- (NSString *)substringCheckWithRange:(NSRange)range;
- (NSString *)substringCheckFromIndex:(NSUInteger)from;
- (NSString *)substringCheckToIndex:(NSUInteger)to;
- (BOOL)myContainsString:(NSString*)string;
@end
