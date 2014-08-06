#import "AppDelegate.h"
#import "NUIAppearance.h"



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NUIAppearance init];
    
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024
                                                         diskCapacity:20 * 1024 * 1024
                                                             diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
    
    
    [Flurry setCrashReportingEnabled:YES];
    
    [Flurry startSession:@"7WMFXCGS6YQJRK52WC9N"];
    return YES;
    
    
}


@end
