
#import "Themer.h"
#import "MainTheme.h"

@implementation Themer


static id currentTheme;

+ (id) currentTheme
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!currentTheme) {
            currentTheme = [[MainTheme alloc] init];
        }
    });
    return currentTheme;
}

- (void) setValue:(id)object forKey:(NSString*)key
{
    id theme = [Themer currentTheme];
    
    if ([object conformsToProtocol:@protocol(NSFastEnumeration)]) {
        for (id item in object) {
            [theme applyThemeForStyleType:key to:item];
        }
    } else {
        [theme applyThemeForStyleType:key to:object];
    }
    return;
}

- (void)applyThemeStyleForStyleType:(NSString *)key to:(id)object {
    [[Themer currentTheme] applyThemeForStyleType:key to:object];
}


@end
