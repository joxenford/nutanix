#import "InteractiveWebGuiViewController.h"

#define kDashbaordURl @"https://dl.dropboxusercontent.com/u/4982785/nutanixWebGUI/dashboard.html"

@interface InteractiveWebGuiViewController ()

@property (weak, nonatomic) IBOutlet UIWebView* webGuiView;

@end

@implementation InteractiveWebGuiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL* url = [NSURL URLWithString:kDashbaordURl];
 //   NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:ReturnCacheDataElseLoad timeoutInterval:30];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [_webGuiView loadRequest:request];
    
	
}

    
    
//    NSString* htmlFile = [[NSBundle mainBundle] pathForResource:@"dashboard" ofType:@"html"];
//    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
//    [_webGuiView setDataDetectorTypes:UIDataDetectorTypeLink];
//    [_webGuiView loadHTMLString:htmlString baseURL:nil];




@end
