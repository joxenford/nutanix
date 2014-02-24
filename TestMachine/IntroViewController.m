#import "IntroViewController.h"
#import "Themer.h"

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
//    [self fadeIn:_nutanixIsASoftwareLabel delay:1];
//    [self fadeIn:_nutanixVirtualComputingLabel delay:5];
//    [self fadeIn:_gladYouAskedLabel delay:9];
//    [self fadeIn:_nextButton delay:12];
}

- (void) fadeIn:(UIView*)view delay:(float) delay;
{
    view.alpha = 0;
    
    [UIView animateWithDuration:1.0 delay:delay options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ view.alpha = 1;}
                     completion:nil];
}

@end
