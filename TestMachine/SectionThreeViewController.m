#import "SectionThreeViewController.h"

@interface SectionThreeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *convergedButton;
@property (strong, nonatomic) IBOutlet UIButton *scaleOutButton;
@property (strong, nonatomic) IBOutlet UIButton *softwareDefinedButton;
@property (strong, nonatomic) IBOutlet UIButton *serverAttachedFlashButton;
@property (strong, nonatomic) IBOutlet UIButton *hybridButton;
@property (strong, nonatomic) IBOutlet UILabel *componetDescriptionLabel;

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
    NSInteger i = [sender tag];
    for (UIView *button in _buttonArray) {
        if ([button isKindOfClass:[UIButton class]]) {
            [(UIButton *)button setSelected:NO];
        }
    }
    
    // Set the current button as the only selected one
      [sender setSelected:YES];
    
    if (i == 1) {
        _componetDescriptionLabel.text = @"Converged";
    }
    if (i == 2) {
        _componetDescriptionLabel.text = @"Scale Out";
    }
    if (i == 3) {
        _componetDescriptionLabel.text = @"Software Defined";
    }
    if (i == 4) {
        _componetDescriptionLabel.text = @"Server-Attached Flash";
    }
    if (i == 5) {
        _componetDescriptionLabel.text = @"Hybrid";
    }
}



@end
