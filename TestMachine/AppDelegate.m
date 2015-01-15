#import "AppDelegate.h"
#import "NUIAppearance.h"
#import "RssParser.h"
#import "MasterViewController.h"
#import "Flurry.h"

@interface AppDelegate ()
@property (strong,nonatomic) RssParser* rssParser;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NUISettings init];
    
    [self configureFlurry];
    
    return YES;
    
    
}

- (void) configureFlurry
{
    [Flurry setCrashReportingEnabled:YES];
    [Flurry startSession:@"7WMFXCGS6YQJRK52WC9N"];
}

-(NSString*) stylesheet
{
    NSString* stylesheet = @"nutanix";
    return stylesheet;
}

@end
