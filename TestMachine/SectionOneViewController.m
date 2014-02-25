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
    [self fadeIn:_webView delay:0.1];
    
}

- (void) fadeIn:(UIView*)view delay:(float) delay;
{
    view.alpha = 0;
    
    [UIView animateWithDuration:1.0 delay:delay options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ view.alpha = 1;}
                     completion:nil];
}



@end
