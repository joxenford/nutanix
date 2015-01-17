#import <Foundation/Foundation.h>

@interface DataService : NSObject

-(void) downloadDataFromURL:(NSURL*)url WithCompletionHandler:(void(^)(NSData*, NSError*))completionHandler;

@end
