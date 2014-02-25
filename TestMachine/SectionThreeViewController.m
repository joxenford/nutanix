#import "SectionThreeViewController.h"

@interface SectionThreeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *convergedButton;
@property (strong, nonatomic) IBOutlet UIButton *scaleOutButton;
@property (strong, nonatomic) IBOutlet UIButton *softwareDefinedButton;
@property (strong, nonatomic) IBOutlet UIButton *serverAttachedFlashButton;
@property (strong, nonatomic) IBOutlet UIButton *hybridButton;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation SectionThreeViewController
{
    NSArray* _buttonArray;
    NSArray* _labelArray;
    NSString* _convergedString;
    NSString* _scaleOutString;
    NSString* _softwareDefinedString;
    NSString* _serverAttachedFlashString;
    NSString* _cloudHybridString;
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
        NSString * fName = [[NSBundle mainBundle] pathForResource:@"converged" ofType:@"txt"];
        if (fName) {
            _convergedString = [NSString stringWithContentsOfFile:fName encoding:NSUTF8StringEncoding error:nil];
        }
        _descriptionLabel.text = _convergedString;
    
    }
    if (i == 2) {
        _descriptionLabel.text = @"Scale Out";
    }
    if (i == 3) {
        _descriptionLabel.text = @"Software Defined";
    }
    if (i == 4) {
        _descriptionLabel.text = @"Server-Attached Flash";
    }
    if (i == 5) {
        _descriptionLabel.text = @"Hybrid";
    }
}



@end
