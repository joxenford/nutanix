#import "WebGuiViewController.h"

@interface WebGuiViewController ()

@property (weak, nonatomic) IBOutlet UIWebView* webGuiWebView;

@end

@implementation WebGuiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString* htmlFile = [[NSBundle mainBundle] pathForResource:@"webGUI-youtube" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [_webGuiWebView loadHTMLString:htmlString baseURL:nil];
    
}



@end
