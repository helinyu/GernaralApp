
#import "ValidateService.h"

@interface ValidateService()
{
    NSRegularExpression *_regexpEmail;
    NSRegularExpression *_regexpMobile;
    NSRegularExpression *_regexpStrictMobile;
    NSRegularExpression *_regexpQQ;
    NSRegularExpression *_regexpNumFirst;
    NSRegularExpression *_regexpGuimiId;
    NSRegularExpression *_regexpCaptcha;
    NSRegularExpression *_regexpPassword;
}

@end

@implementation ValidateService

- (BOOL)isMobile:(NSString *)str {
    return [self checkWithRegexp:_regexpMobile withInput:str];
}

- (BOOL)isStrictMobile:(NSString *)str {
    return [self checkWithRegexp:_regexpStrictMobile withInput:str];
}

- (BOOL)isEmail:(NSString *)str {
    return [self checkWithRegexp:_regexpEmail withInput:str];
}

- (BOOL)isQQ:(NSString *)str {
    return [self checkWithRegexp:_regexpQQ withInput:str];
}

- (BOOL)isNumFirst:(NSString *)str {
    return [self checkWithRegexp:_regexpNumFirst withInput:str];
}

- (BOOL)isGuimiId:(NSString *)str {
    return [self checkWithRegexp:_regexpGuimiId withInput:str];
}

- (BOOL)isCaptcha:(NSString *)str {
    return [self checkWithRegexp:_regexpCaptcha withInput:str];
}

- (BOOL)isName:(NSString *)str {
    return ((str.length > 0) && (str.length <= 12));
}

- (BOOL)isPassword:(NSString *)str {
    return [self checkWithRegexp:_regexpPassword withInput:str];
}

#pragma mark - Private Functions
- (instancetype)init {
    self = [super init];
    if(self) {
        _regexpEmail = [[NSRegularExpression alloc] initWithPattern:@"^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$" options:NSRegularExpressionCaseInsensitive error:nil];
        _regexpMobile = [[NSRegularExpression alloc] initWithPattern:@"^1[0-9]{10}$" options:NSRegularExpressionCaseInsensitive error:nil];
        _regexpStrictMobile = [[NSRegularExpression alloc] initWithPattern:@"^1[34578][0-9]{9}$" options:NSRegularExpressionCaseInsensitive error:nil];
        _regexpQQ = [[NSRegularExpression alloc] initWithPattern:@"^\\d{5,11}$" options:NSRegularExpressionCaseInsensitive error:nil];
        _regexpNumFirst = [[NSRegularExpression alloc] initWithPattern:@"^[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
        _regexpGuimiId = [[NSRegularExpression alloc] initWithPattern:@"^[a-zA-Z][-_a-zA-Z0-9]{5,19}$" options:NSRegularExpressionCaseInsensitive error:nil];
        _regexpCaptcha = [[NSRegularExpression alloc] initWithPattern:@"^[0-9]{4}$" options:NSRegularExpressionCaseInsensitive error:nil];
        _regexpPassword = [[NSRegularExpression alloc] initWithPattern:@"^\\S{6,16}$" options:NSRegularExpressionCaseInsensitive error:nil];
    }
    return self;
}

- (BOOL)checkWithRegexp:(const NSRegularExpression *)regexp withInput:(NSString *)input {
    if(!input)
        return NO;
    return ([regexp numberOfMatchesInString:input options:0 range:NSMakeRange(0, input.length)] > 0);
}

@end
