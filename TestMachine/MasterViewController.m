#import "MasterViewController.h"
#import "DetailViewController.h"
#import "XMLFeedItem.h"
#import "NewsAndEventsCell.h"
#import "RssParser.h"

@interface MasterViewController () <NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet UITableView* tableView;
@property (strong, nonatomic) NSArray* newsFeed;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    if (!self.rssParser) {
    self.rssParser = [[RssParser alloc] init];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.rssParser parseXMLWithSuccess:^(NSArray *stories) {
        self.newsFeed = stories;
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:self waitUntilDone:YES];
    } orFailure:^(NSError *error) {
        // add error handler
    }];

}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.newsFeed count];
}


- (NewsAndEventsCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* tableIdentifier = @"cell";
    NewsAndEventsCell* cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    XMLFeedItem* newsItem = [self.newsFeed objectAtIndex:indexPath.row];
    cell.titleLabel.text = [newsItem title];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMLFeedItem* newsItem = [self.newsFeed objectAtIndex:indexPath.row];
    [self.detailViewController updateLabel:[newsItem link]];
    [self.detailViewController loadWebView:[newsItem content]];
}


- (void) prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController* detailViewController = segue.destinationViewController;
        XMLFeedItem* newsItem = [self.newsFeed objectAtIndex:indexPath.row];
        detailViewController.url = [newsItem link];
        detailViewController.content = [newsItem content];
        [Flurry logEvent:[newsItem title]];
       
    }
}


@end
