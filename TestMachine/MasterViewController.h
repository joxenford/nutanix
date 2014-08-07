
#import <UIKit/UIKit.h>

@class DetailViewController;
@class RssParser;

@interface MasterViewController : UITableViewController

@property (strong,nonatomic) RssParser* rssParser;
@property (strong, nonatomic) DetailViewController* detailViewController;

@end
