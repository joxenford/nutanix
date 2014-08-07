#import <Foundation/Foundation.h>

@interface RssParser : NSObject

- (void)parseXMLWithSuccess:(void(^)(NSArray*))successBlock orFailure:(void(^)(NSError*))failureBlock;

@end
