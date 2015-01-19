#import "DataService.h"

@implementation DataService

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


-(void) downloadDataFromURL:(NSURL*)url WithCompletionHandler:(void(^)(NSData*, NSError*))completionHandler;
{
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData *data,
                                                     NSURLResponse *response,
                                                     NSError *connectionError) {
        if (connectionError) {
            NSLog(@"%@", connectionError.localizedDescription);
            completionHandler(nil, connectionError);
        }
        if (response) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200 && data)
                NSLog(@"%@", response);
                NSLog(@"%@", data);
                completionHandler(data, nil);
        }
           }] resume];
}

@end
