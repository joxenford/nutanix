#import "SectionThreeViewController.h"

@interface SectionThreeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *convergedButton;
@property (strong, nonatomic) IBOutlet UIButton *scaleOutButton;
@property (strong, nonatomic) IBOutlet UIButton *softwareDefinedButton;
@property (strong, nonatomic) IBOutlet UIButton *serverAttachedFlashButton;
@property (strong, nonatomic) IBOutlet UIButton *hybridButton;

@end

@implementation SectionThreeViewController
{
    NSArray* _buttonArray;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _buttonArray = @[_convergedButton, _scaleOutButton, _softwareDefinedButton, _serverAttachedFlashButton, _hybridButton];
}


- (IBAction)buttonPressed:(id)sender
{
    // Unselect all the buttons in the parent view
    for (UIView *button in _buttonArray) {
        if ([button isKindOfClass:[UIButton class]]) {
            [(UIButton *)button setSelected:NO];
        }
    }
    
    // Set the current button as the only selected one
      [sender setSelected:YES];
}



@end
