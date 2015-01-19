#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* content;
@property (weak, nonatomic) IBOutlet UIWebView* webView;

- (void)updateLabel:(NSString*)passedObject;
- (void)loadWebView:(NSString*)content;

@end
