#import "SessionManager.h"

@interface SessionManager ()

@end

@implementation SessionManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype) initWithDataService:(DataService*)dataService;
{
    self = [super init];
    self.dataService = dataService;
    return self;
}

@end
