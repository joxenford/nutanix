#import "UIView+Animation.h"

@implementation UIView (Animation)


- (void) fadeInWithDuration:(float) duration delay:(float) delay;
{
    self.alpha = 0;
    
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ self.alpha = 1;}
                     completion:nil];
}

@end
