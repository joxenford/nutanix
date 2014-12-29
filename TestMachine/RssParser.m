#import "RssParser.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "XMLFeedItem.h"
#import "NewsAndEventsCell.h"

#define kFeedURL @"http://www.nutanix.com/feed/"

@interface RssParser ()  <NSXMLParserDelegate>

@property (strong, nonatomic) NSXMLParser* rssParser;
@property (strong, nonatomic) NSString* element;
@property (strong, nonatomic) NSMutableString* title;
@property (strong, nonatomic) NSMutableString* date;
@property (strong, nonatomic) NSMutableString* link;
@property (strong, nonatomic) NSMutableString* summary;
@property (strong, nonatomic) NSMutableString* content;
@property (strong, nonatomic) NSMutableArray* stories;

@end

@implementation RssParser


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.stories = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)parseXMLWithSuccess:(void(^)(NSArray*))successBlock orFailure:(void(^)(NSError*))failureBlock
{
    NSURL* url = [NSURL URLWithString:kFeedURL];
    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLCacheStorageNotAllowed timeoutInterval:10];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse* response,
                                               NSData* data,
                                               NSError* connectionError) {
                               if (connectionError) {
                                   failureBlock(connectionError);
                               }
                               else {
                                   self.stories = [[NSMutableArray alloc] init];
                                   self.rssParser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:kFeedURL]];
                                   [self.rssParser setDelegate:self];
                                   [self.rssParser parse];
                                   
                                   successBlock(self.stories);
                               }
                           }];

}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (parser == self.rssParser) {
        self.element = elementName;
        if ([self.element isEqualToString:@"item"]) {
            self.title   = [[NSMutableString alloc] init];
            self.date    = [[NSMutableString alloc] init];
            self.link    = [[NSMutableString alloc] init];
            self.summary = [[NSMutableString alloc] init];
            self.content = [[NSMutableString alloc] init];
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (parser == self.rssParser) {
        if ([self.element  isEqualToString:@"title"]) {
            [self.title appendString:string];
            
        } else if ([self.element isEqualToString:@"link"]) {
            [self.link appendString:string];
            
        } else if ([self.element  isEqualToString:@"description"]) {
            [self.summary appendString:string];
            
        } else if ([self.element isEqualToString:@"pubDate"]) {
            [self.date appendString:string];
        } else if ([self.element isEqualToString:@"content:encoded"])
            [self.content appendString:string];
    }
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (parser == self.rssParser) {
        if ([elementName isEqualToString:@"item"]) {
            XMLFeedItem* newsItem = [[XMLFeedItem alloc]
                                     initWithType:XMLFeedItemArticle
                                     title:[self.title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                     date:[self.date stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                     link:[self.link stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                     summary:[self.description stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                     content:[self.content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                     ];
            [self.stories addObject:newsItem];
        }
    }
}


@end
