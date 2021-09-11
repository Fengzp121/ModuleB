//
//  DictSearchRequest.m
//  ModuleB
//
//  Created by ffzp on 2021/9/11.
//

#import "DictSearchRequest.h"

@implementation DictSearchRequest
{
    NSString *_q;
    NSInteger _size;
    NSString *_doctype;
}

-(instancetype)initRequestWithKey:(nonnull NSString *)q size:(NSInteger)size doctype:(nullable NSString *)doctype{
    if(self = [super init]){
        _q = q;
        _size = size;
        _doctype = doctype;
    }
    return self;
}

-(NSString *)baseUrl{
    return @"http://dict.youdao.com/suggest";
}

-(NSString *)requestUrl{
    NSMutableString *paramStr = [NSMutableString stringWithString:@"?"];
    [paramStr appendFormat:@"q=%@",_q];
    if(_size > 0){
        [paramStr appendFormat:@"&size=%li",_size];
    }
    if(_doctype){
        [paramStr appendFormat:@"&doctype=%@",_doctype];
    }
    return paramStr;
}

@end
