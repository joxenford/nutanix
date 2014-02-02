
#import <Foundation/Foundation.h>
@protocol Themer

- (void)applyThemeStyleForStyleType:(NSString *)key to:(id)object;

@end

@interface Themer : NSObject

@property (nonatomic, weak) IBOutletCollection(UIView) NSArray* titleStyle;
@property (nonatomic, weak) IBOutletCollection(UIView) NSArray* psuedoTabStyle;

@end
