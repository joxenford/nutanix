#import "SectionTwoViewController.h"

@interface SectionTwoViewController ()
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labelArray_1;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *bulletPoints;

@end

@implementation SectionTwoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayBulletPoints];
   
    

}



- (void) displayBulletPoints
{
    float delay = 3;
    for (UIView *labels in _bulletPoints) {
        if ([labels isKindOfClass:[UILabel class]]) {
            [(UILabel *)labels fadeInWithDuration:1 delay:delay];
        }
        delay = delay + 1.5;
    }
}

@end
