#import "AppDelegate.h"
#import "NUIAppearance.h"
#import "RssParser.h"
#import "MasterViewController.h"
#import "Flurry.h"
#import "DataService.h"
#import "SessionManager.h"

@interface AppDelegate ()
@property (strong,nonatomic) RssParser* rssParser;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NUISettings init];
    [self configureFlurry];
  
    DataService* dataService = [[DataService alloc] init];
    SessionManager* sessionManager = [[SessionManager alloc] initWithDataService:dataService];
    
    [sessionManager.dataService downloadDataFromURL:[NSURL URLWithString:@"http://www.nutanix.com/feed/"]WithCompletionHandler:^(NSData *data, NSError *error) {
        RssParser* rssParser = [[RssParser alloc] init];
        [rssParser configureParserWithData:data];
        
    }];
    
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
