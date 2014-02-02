#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton* startWalkthrough;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;

@property NSUInteger pageIndex;
@property NSString* titleText;
@property NSString* imageFile;


@end
