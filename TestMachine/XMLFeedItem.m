#import "XMLFeedItem.h"

@implementation XMLFeedItem

static NSDateFormatter* DATE_FORMATTER;

+ (void) initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DATE_FORMATTER = [[NSDateFormatter alloc] init];
        [DATE_FORMATTER setDateStyle:NSDateFormatterShortStyle];
    });
}

- (instancetype) initWithType:(XMLFeedItemType)type title:(NSString*)title date:(NSString*)date link:(NSString*)link description:(NSString*)description content:(NSString*)content
{
    if (nil != (self = [super init])) {
        _type = type;
        _title = title;
        _date = [DATE_FORMATTER dateFromString:date];
        _dateAsString = date;
        _link = link;
        _description = description;
        _content = content;
    }
    return self;
}

@end
