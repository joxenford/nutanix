#import "InteractiveWebGuiViewController.h"

@interface InteractiveWebGuiViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webGuiView;

@end

@implementation InteractiveWebGuiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString* htmlFile = [[NSBundle mainBundle] pathForResource:@"nutanixWebGUI/dashboard" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [_webGuiView loadHTMLString:htmlString baseURL:nil];
    
}



@end
