#import "DataService.h"

@implementation DataService

-(void) downloadDataFromURL:(NSURL*)url WithCompletionHandler:(void(^)(NSData*, NSError*))completionHandler;
{
    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse* response,
                                               NSData* data,
                                               NSError* connectionError) {
                               if (connectionError) {
                                   completionHandler(nil, connectionError);
                               }
                               else { 
                                   completionHandler(data, nil);
                               }
                           }];

}

@end
