//
//  NSString+Highlight.m
//  guimiquan
//
//  Created by Jesse Ou on 14-10-13.
//  Copyright (c) 2014年 Vanchu. All rights reserved.
//

#import "NSString+Helper.h"
#import "AppDefinition.h"
#import "UIColor+Helper.h"

@implementation NSString (Helper)

- (void)makeRangeWithString:(NSString *)mstr withKeyword:(NSString *)search withRangeArray:(NSMutableArray *)rangeArray
{
    NSRange substr = [mstr rangeOfString:search];
    while (substr.location != NSNotFound) {
        NSString *preString = @"";
        if (substr.location != 0) {
            preString = [mstr substringWithRange:NSMakeRange(0, substr.location)];
        }
        NSString *endString = @"";
        if ((substr.location + substr.length) < mstr.length) {
            endString = [mstr substringCaptureFromIndex:(substr.location + substr.length)];
        }
        NSRange preRange = [preString rangeOfString:@"<"];
        NSRange endRange = [endString rangeOfString:@">"];
        
        //判断是否表情里面的文字
        if (preRange.location == NSNotFound || endRange.location == NSNotFound) {
            //直接添加第一个range
            if (rangeArray.count == 0) {
                [rangeArray addObject:[NSValue valueWithRange:substr]];
            }else{
                for (NSInteger i=0; i<rangeArray.count; i++) {
                    NSRange thisRange = [rangeArray[i] rangeValue];
                    if (thisRange.location > substr.location + substr.length) {
                        [rangeArray insertObject:[NSValue valueWithRange:substr] atIndex:i];
                        break;
                    }else if (thisRange.location + thisRange.length >= substr.location ) {
                        NSUInteger length = thisRange.length;
                        if (thisRange.location+thisRange.length < substr.location+substr.length) {
                            length = substr.location+substr.length - thisRange.location;
                        }
                        NSRange addRange = NSMakeRange(thisRange.location, length);
                        [rangeArray replaceObjectAtIndex:i withObject:[NSValue valueWithRange:addRange ]];
                        if (i < rangeArray.count - 1) {
                            NSRange nextRange = [rangeArray[i+1] rangeValue];
                            thisRange = [rangeArray[i] rangeValue];
                            if (thisRange.location + thisRange.length >= nextRange.location ) {
                                NSUInteger length = thisRange.length;
                                if (thisRange.location+thisRange.length < nextRange.location+nextRange.length) {
                                    length = nextRange.location+nextRange.length - thisRange.location;
                                }
                                NSRange addRange = NSMakeRange(thisRange.location, length);
                                [rangeArray replaceObjectAtIndex:i withObject:[NSValue valueWithRange:addRange]];
                                [rangeArray removeObjectAtIndex:i+1];
                            }
                            
                        }
                        break;
                    }else if (i == rangeArray.count - 1) {
                        [rangeArray addObject:[NSValue valueWithRange:substr]];
                        break;
                    }else{
                        continue;
                    }
                }
            }
        }
        //匹配下一个
        substr = [mstr rangeOfString:search options:NSCaseInsensitiveSearch range:NSMakeRange(substr.location+substr.length, mstr.length - substr.location - substr.length)];
    }
}

- (NSMutableArray *)highlightRangeArrayWithKeywords:(NSArray *)keywords
{
    NSString *string = self;
    NSMutableArray *rangeArray = [[NSMutableArray alloc] init];
    
    //遍历关键词
    for (NSInteger i = 0; i < keywords.count; i++) {
        NSString *keyword = [NSString stringWithFormat:@"%@",keywords[i]];
        [self makeRangeWithString:[string lowercaseString] withKeyword:keyword withRangeArray:rangeArray];
    }
    
    //过滤&nbsp;
    NSMutableArray *rangeNbspArray = [[NSMutableArray alloc] init];
    [self makeRangeWithString:[string lowercaseString] withKeyword:@"&nbsp;" withRangeArray:rangeNbspArray];
    for (NSInteger i=rangeArray.count-1; i>=0; i--) {
        NSRange thisRange = [rangeArray[i] rangeValue];
        for (NSInteger j = 0; j < rangeNbspArray.count; j++) {
            NSRange nbspRange = [rangeNbspArray[j] rangeValue];
            if (thisRange.location >= nbspRange.location && thisRange.location < (nbspRange.location + nbspRange.length)) {
                [rangeArray removeObjectAtIndex:i];
                break;
            }else if (nbspRange.location > thisRange.location){
                break;
            }
        }
    }
    return rangeArray;
}

- (NSMutableArray *)highlightAttributeStrWithKeywords:(NSArray *)keywords
{
    NSString *string = self;
    NSMutableArray *rangeArray = [[NSMutableArray alloc] init];
    
    //遍历关键词
    for (NSInteger i = 0; i < keywords.count; i++) {
        NSString *keyword = [NSString stringWithFormat:@"%@",keywords[i]];
        [self makeRangeWithString:string withKeyword:keyword withRangeArray:rangeArray];
    }
    
    //过滤&nbsp;
    NSMutableArray *rangeNbspArray = [[NSMutableArray alloc] init];
    [self makeRangeWithString:[string lowercaseString] withKeyword:@"&nbsp;" withRangeArray:rangeNbspArray];
    for (NSInteger i=rangeArray.count-1; i>=0; i--) {
        NSRange thisRange = [rangeArray[i] rangeValue];
        for (NSInteger j = 0; j < rangeNbspArray.count; j++) {
            NSRange nbspRange = [rangeNbspArray[j] rangeValue];
            if (thisRange.location >= nbspRange.location && thisRange.location < (nbspRange.location + nbspRange.length)) {
                [rangeArray removeObjectAtIndex:i];
                break;
            }else if (nbspRange.location > thisRange.location){
                break;
            }
        }
    }
    return rangeArray;
}


- (NSString *)highlightWithKeywords:(NSArray *)keywords
{
    NSString *string = self;
    NSMutableArray *rangeArray = [[NSMutableArray alloc] init];
    
    //遍历关键词
    for (NSInteger i = 0; i < keywords.count; i++) {
        NSString *keyword = [NSString stringWithFormat:@"%@",keywords[i]];
        [self makeRangeWithString:[string lowercaseString] withKeyword:keyword withRangeArray:rangeArray];
    }
    
    //过滤&nbsp;
    NSMutableArray *rangeNbspArray = [[NSMutableArray alloc] init];
    [self makeRangeWithString:[string lowercaseString] withKeyword:@"&nbsp;" withRangeArray:rangeNbspArray];
    for (NSInteger i=rangeArray.count-1; i>=0; i--) {
        NSRange thisRange = [rangeArray[i] rangeValue];
        for (NSInteger j = 0; j < rangeNbspArray.count; j++) {
            NSRange nbspRange = [rangeNbspArray[j] rangeValue];
            if (thisRange.location >= nbspRange.location && thisRange.location < (nbspRange.location + nbspRange.length)) {
                [rangeArray removeObjectAtIndex:i];
                break;
            }else if (nbspRange.location > thisRange.location){
                break;
            }
        }
    }
    
    NSString *htmlString = [[NSString alloc] init];
    
    if (rangeArray.count > 0) {
        //根据range高亮
        NSString *startString = [string substringCaptureToIndex:[rangeArray[0] rangeValue].location];
        NSString *endString = [string substringCaptureFromIndex:[rangeArray[rangeArray.count-1] rangeValue].location + [rangeArray[rangeArray.count-1] rangeValue].length];
        
        htmlString = [htmlString stringByAppendingString:startString];
        NSMutableArray *stringArray = [[NSMutableArray alloc] init];
        for (NSInteger i=0; i<rangeArray.count; i++) {
            NSRange thisRange = [rangeArray[i] rangeValue];
            NSString *thisString = [string substringWithRange:thisRange];
//            thisString = [NSString stringWithFormat:@"<font color=\"#%@\">%@</font>", BBS_FONT_COLOR_RED_STRING, thisString];
            [stringArray addObject:thisString];
            htmlString = [htmlString stringByAppendingString:thisString];
            if (i < rangeArray.count - 1) {
                NSRange nextRange = [rangeArray[i+1] rangeValue];
                thisString = [string substringWithRange:NSMakeRange(thisRange.location+thisRange.length, nextRange.location - thisRange.location - thisRange.length)];
                htmlString = [htmlString stringByAppendingString:thisString];
            }else{
                htmlString = [htmlString stringByAppendingString:endString];
            }
        }
        
    }else{
        htmlString = string;
    }
    return htmlString;
}

/**
 *  切长度时考虑到输入法表情,英文汉字占1字符, 表情占2个
 *
 *  @param range 区间
 *  @return 输出
 */
-(NSString *)substringCaptureInRange:(NSRange)range {
    if((self.length > range.location && range.length > 0) && self.length >= (range.location + range.length))
    {
        NSString* baseStr = [self substringWithRange:NSMakeRange(range.location, MIN(range.length, self.length))];
        if (baseStr.length == 0) {
            return self;
        }
        
        //判断前面是不是切错了
        NSString *tmpStr;
        NSString *tmp2Str;
        
        tmpStr = [baseStr substringWithRange:NSMakeRange(0,1)];//每次取1个长度
        if ([tmpStr UTF8String] == NULL) {
            tmp2Str = [baseStr substringWithRange:NSMakeRange(0,2)];
            if([tmp2Str UTF8String] == NULL)
            {
                baseStr = [baseStr substringFromIndex:1];
            }
        }
        tmpStr = [baseStr substringWithRange:NSMakeRange(baseStr.length-1,1)];//每次取1个长度
        if ([tmpStr UTF8String] == NULL) {
            
            tmp2Str = [baseStr substringWithRange:NSMakeRange(baseStr.length-2,2)];
            if([tmp2Str UTF8String] == NULL)
            {
                baseStr = [baseStr substringWithRange:NSMakeRange(0, baseStr.length-1)];
            }
        }
        return baseStr;
    }
    else if(range.length ==0)
    {
        return @"";
    }
    else
    {
        return self;
    }
}

- (NSString *)substringCaptureFromIndex:(NSUInteger)from {
    if(from >= self.length)
    {
        return @"";
    }
    return [self substringCaptureInRange:NSMakeRange(from, self.length-from)];
    
}

- (NSString *)substringCaptureToIndex:(NSUInteger)to {
    if(to > self.length)
    {
        return self;
    }
    return [self substringCaptureInRange:NSMakeRange(0, to)];
}

- (NSString *)urlEncode {
//    NSString *outputStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
//                                                                                                (CFStringRef)self,
//                                                                                                NULL,
//                                                                                                (CFStringRef)@"!*'();:@&=+$,/?%#[]",
//                                                                                                kCFStringEncodingUTF8));
    
    NSString *outputStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, nil, nil, kCFStringEncodingUTF8));
    return outputStr;
}

- (NSString *)urlDecode {
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)self,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

- (NSString *)urlEncodeAll {
    NSString *outputStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                (CFStringRef)self,
                                                                                                NULL,
                                                                                                (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                                kCFStringEncodingUTF8));
    return outputStr;
}

- (NSArray *)componentsSeparatedByString:(NSString *)separator limit:(NSUInteger)limit {
	if (limit == 0)
		return [NSArray array];
	if (limit == 1)
		return [NSArray arrayWithObject:self];
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:limit];
	NSUInteger length = [self length];
	NSUInteger pos = 0;
	while (limit >= 2) {
		NSRange rng = [self rangeOfString:separator options:0 range:NSMakeRange(pos, length - pos)];
		if (rng.location == NSNotFound)
			break;
		[array addObject:[self substringWithRange:NSMakeRange(pos, rng.location - pos)]];
		pos = rng.location + rng.length;
		--limit;
	}
	[array addObject:[self substringFromIndex:pos]];
	return [NSArray arrayWithArray:array];
}


- (NSString*)substringCheckWithRange:(NSRange)range
{
    if((self.length > range.location && range.length > 0) && self.length >= (range.location + range.length))
    {
        return [self substringWithRange:range];
    }
    else{
        return @"";
    }
}


- (NSString*)substringCheckFromIndex:(NSUInteger)from
{
    if(from > self.length)
    {
        return @"";
    }
    return [self substringFromIndex:from];
    
}


- (NSString *)substringCheckToIndex:(NSUInteger)to
{
    if(to > self.length)
    {
        return @"";
    }
    return [self substringToIndex:to];
}

- (BOOL)myContainsString:(NSString*)string{
    NSRange range = [self rangeOfString:string];
    if (range.location !=NSNotFound) {
        return YES;
    }
    return NO;
}
@end
