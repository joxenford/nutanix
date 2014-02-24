#import "VideoMasterViewController.h"
#import "XMLFeedItem.h"
#import "NewsAndEventsCell.h"



#define kFeedURL @"http://gdata.youtube.com/feeds/api/users/nutanix/uploads"

@interface VideoMasterViewController () <NSXMLParserDelegate> {
    NSMutableArray *_objects;
    NSXMLParser* rssParser;
    NSMutableArray* newsFeed;
    NSMutableString* title;
    NSMutableString* date;
    NSMutableString* summary;
    NSMutableString* link;
    NSMutableString* description;
    NSMutableString* content;
    NSString* element;
    NSURL* url;
    UIFont* regularFont;
    IBOutlet UITableView* newsTable;
}
@end

@implementation VideoMasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    regularFont = [UIFont fontWithName:@"Lato-Regular" size:15];
	// Do any additional setup after loading the view, typically from a nib.
    // self.navigationItem.leftBarButtonItem = self.editButtonItem;
    //   UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //   self.navigationItem.rightBarButtonItem = addButton;
    
    self.detailViewController = (VideoDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    [self parseXML];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) parseXML
{
	newsFeed = [[NSMutableArray alloc] init]; //allocate and initiize an array to hold the entire feed
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:kFeedURL]]; //allocate and initize the parser object and feed it the URL
    [rssParser setDelegate:self]; //this view controller will be the delegete of NSXMLParser
	[rssParser parse]; //send the rssParser the parse message. this will start to call the methods below
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (parser == rssParser) {
        element = elementName;
        if ([element isEqualToString:@"entry"]) {
            title   = [[NSMutableString alloc] init];
            date    = [[NSMutableString alloc] init];
            link    = [[NSMutableString alloc] init];
            description = [[NSMutableString alloc] init];
            content = [[NSMutableString alloc] init];
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (parser == rssParser) {
        if ([element isEqualToString:@"title"]) {
            [title appendString:string];
            
        } else if ([element isEqualToString:@"link"]) {
            [link appendString:string];
            
        } else if ([element isEqualToString:@"description"]) {
            [description appendString:string];
            
        } else if ([element isEqualToString:@"pubDate"]) {
            [date appendString:string];
        } else if ([element isEqualToString:@"content:encoded"])
            [content appendString:string];
    }
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (parser == rssParser) {
        if ([elementName isEqualToString:@"item"]) {
            XMLFeedItem* newsItem = [[XMLFeedItem alloc]
                                     initWithType:XMLFeedItemArticle
                                     title:[title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                     date:[date stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                     link:[link stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                     description:[description stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                     content:[content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                     ];
            [newsFeed addObject:newsItem];
            [newsTable reloadData];
            NSLog(@"news feed: %@", newsFeed);
        }
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [newsFeed count];
}


- (NewsAndEventsCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* tableIdentifier = @"cell";
    NewsAndEventsCell* cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    XMLFeedItem* newsItem = [newsFeed objectAtIndex:indexPath.row];
    cell.titleLabel.text = [newsItem title];
    cell.titleLabel.font = regularFont;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMLFeedItem* newsItem = [newsFeed objectAtIndex:indexPath.row];
    [self.detailViewController updateLabel:[newsItem link]];
    [self.detailViewController loadWebView:[newsItem content]];
}

- (void) prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        VideoDetailViewController* detailViewController = segue.destinationViewController;
        XMLFeedItem* newsItem = [newsFeed objectAtIndex:indexPath.row];
        detailViewController.url = [newsItem link];
        detailViewController.content = [newsItem content];
        
    }
}






@end