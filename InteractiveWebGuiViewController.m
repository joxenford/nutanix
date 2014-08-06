#import "InteractiveWebGuiViewController.h"

#define kDashbaordURl @"http://nutanix.virtuallygeeky.com/dashboard.html"

@interface InteractiveWebGuiViewController ()

@property (weak, nonatomic) IBOutlet UIWebView* webGuiView;

@end

@implementation InteractiveWebGuiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL* url = [NSURL URLWithString:kDashbaordURl];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [_webGuiView loadRequest:request];
    [_webGuiView  fadeInWithDuration:1 delay:0.1];
    [Flurry logEvent:@"WebGUI launched"];
	
}

@end
