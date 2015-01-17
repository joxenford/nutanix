#import <Foundation/Foundation.h>

@interface DataService : NSObject

-(void) downloadDataWithCompletionHandler:(void(^)(NSData*, NSError*))completionHandler;

@end
