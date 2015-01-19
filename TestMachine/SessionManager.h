#import <Foundation/Foundation.h>
#import "DataService.h"

@interface SessionManager : NSObject

@property (strong) DataService* dataService;
@property (strong) NSArray* stories;

-(instancetype) initWithDataService:(DataService*)dataService;

@end
