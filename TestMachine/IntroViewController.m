#import "IntroViewController.h"
#import "Themer.h"
#import "UIView+Animation.h"

@interface IntroViewController ()

@property (weak, nonatomic) IBOutlet UILabel* nutanixIsASoftwareLabel;
@property (weak, nonatomic) IBOutlet UILabel* nutanixVirtualComputingLabel;
@property (weak, nonatomic) IBOutlet UILabel* gladYouAskedLabel;
@property (weak, nonatomic) IBOutlet UIButton* nextButton;

@end

@implementation IntroViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_nutanixIsASoftwareLabel fadeInWithDuration:1 delay:1];
    [_nutanixVirtualComputingLabel fadeInWithDuration:1 delay:5];
    [_gladYouAskedLabel fadeInWithDuration:1 delay:9];
    [_nextButton fadeInWithDuration:1 delay:12];
}

//- (void) fadeIn:(UIView*)view delay:(float) delay;
//{
//    view.alpha = 0;
//    
//    [UIView animateWithDuration:1.0 delay:delay options:UIViewAnimationOptionCurveEaseIn
//                     animations:^{ view.alpha = 1;}
//                     completion:nil];
//}

@end
