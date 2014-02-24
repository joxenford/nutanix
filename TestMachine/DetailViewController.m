#import "DetailViewController.h"
#import "XMLFeedItem.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

// (void)configureView;
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

//- (void)configureView
//{
//    // Update the user interface for the detail item.
//
////    if (self.detailItem) {
////        self.detailDescriptionLabel.text = [self.detailItem description];
//    if (self.url) {
//        self.detailDescriptionLabel.text = _url; }
//    NSLog(@"Passed URL: %@", _url);
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 //   [self configureView];
  
    [self loadWebView:self.content];
    
}
- (void) loadWebView:(NSString *)content
{
    NSURL* url = [NSURL URLWithString:self.url];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
 //   [self.webView loadHTMLString:self.content baseURL:nil];
 //   NSLog(@"content: %@", content);
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
