#import <Foundation/Foundation.h>

@interface RssParser : NSObject

- (void)parseXMLWithCompletionHandler:(void (^)(NSArray* stories, NSError *))completionHandler;

@end
