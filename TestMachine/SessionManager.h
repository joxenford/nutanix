#import <Foundation/Foundation.h>
#import "DataService.h"

@interface SessionManager : NSObject

@property (strong) DataService* dataService;

-(instancetype) initWithDataService:(DataService*)dataService;

@end
