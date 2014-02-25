#import "SectionOneViewController.h"

@interface SectionOneViewController ()

@property (weak, nonatomic) IBOutlet UIWebView* webView;

@end

@implementation SectionOneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* htmlFile = [[NSBundle mainBundle] pathForResource:@"youtube" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [_webView loadHTMLString:htmlString baseURL:nil];
    [_webView fadeInWithDuration:1 delay:0.1];
    
}

@end
