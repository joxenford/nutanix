#import <UIKit/UIKit.h>
#import "SessionManager.h"
@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController* detailViewController;
@property (strong) SessionManager* sessionManager;

@end
