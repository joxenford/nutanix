#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController <UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController* pageViewController;
@property (strong, nonatomic) NSArray* pageTitles;
@property (strong, nonatomic) NSArray* pageImages;

@end
