//
//  DictSearchRequest.h
//  ModuleB
//
//  Created by ffzp on 2021/9/11.
//

#import <FF_HttpNetwork/YTKRequest.h>

NS_ASSUME_NONNULL_BEGIN

@interface DictSearchRequest : YTKRequest
-(instancetype)initRequestWithKey:(nonnull NSString *)q size:(NSInteger)size doctype:(nullable NSString *)doctype;
@end

NS_ASSUME_NONNULL_END
