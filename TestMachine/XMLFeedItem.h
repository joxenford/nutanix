
typedef enum {
    XMLFeedItemArticle,
    XMLFeedItemEvent,
    XMLFeedItemReference
} XMLFeedItemType;

@interface XMLFeedItem : NSObject

@property (nonatomic, assign, readonly) XMLFeedItemType type;
@property (nonatomic, strong, readonly) NSString* title;
@property (nonatomic, strong, readonly) NSDate* date;
@property (nonatomic, strong, readonly) NSString* dateAsString;
@property (nonatomic, strong, readonly) NSString* link;
@property (nonatomic, strong, readonly) NSString* description;
@property (nonatomic, strong, readonly) NSString* content;

- (instancetype) initWithType:(XMLFeedItemType)type title:(NSString*)title date:(NSString*)date link:(NSString*)link description:(NSString*)description content:(NSString*)content;

@end
