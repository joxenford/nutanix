#import <Foundation/Foundation.h>

@interface RssParser : NSObject

- (void)parseXMLWithSuccess:(void(^)(NSArray*))successBlock orFailure:(void(^)(NSError*))failureBlock;

- (void)parseXMLWithCompletionHandler:(void (^)(NSArray* stories, NSError *))completionHandler;

@end
