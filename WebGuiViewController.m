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
    [self fadeIn:_webGuiWebView delay:0.1];
}

- (void) fadeIn:(UIView*)view delay:(float) delay;
{
    view.alpha = 0;
    
    [UIView animateWithDuration:1.0 delay:delay options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ view.alpha = 1;}
                     completion:nil];
}

@end
