#import "DetailViewController.h"
#import "XMLFeedItem.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;


@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void) updateLabel:(NSString *)passedObject
{
    if (![self.detailDescriptionLabel.text isEqualToString:passedObject]) {
        self.detailDescriptionLabel.text = passedObject;
        self.url = passedObject;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadWebView:self.content];
    
}
- (void) loadWebView:(NSString *)content
{
    NSURL* url = [NSURL URLWithString:self.url];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];

}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
