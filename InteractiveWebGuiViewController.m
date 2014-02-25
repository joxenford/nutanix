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
    [self fadeIn:_webGuiView delay:0.1];
	
}

- (void) fadeIn:(UIView*)view delay:(float) delay;
{
    view.alpha = 0;
    
    [UIView animateWithDuration:1.0 delay:delay options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ view.alpha = 1;}
                     completion:nil];
}




@end
