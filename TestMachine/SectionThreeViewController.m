#import "SectionThreeViewController.h"

@interface SectionThreeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *convergedButton;
@property (strong, nonatomic) IBOutlet UIButton *scaleOutButton;
@property (strong, nonatomic) IBOutlet UIButton *softwareDefinedButton;
@property (strong, nonatomic) IBOutlet UIButton *serverAttachedFlashButton;
@property (strong, nonatomic) IBOutlet UIButton *hybridButton;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *decriptionScrollView;
@property (strong) NSArray* buttonArray;

@end

@implementation SectionThreeViewController
{
    NSString* _descriptionString;
    NSString* _scaleOutString;
    NSString* _softwareDefinedString;
    NSString* _serverAttachedFlashString;
    NSString* _cloudHybridString;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.buttonArray = @[_convergedButton, _scaleOutButton, _softwareDefinedButton, _serverAttachedFlashButton, _hybridButton];
    [Flurry logEvent:@"Section Three Viewed"];
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
        NSString* fileName = [[NSBundle mainBundle] pathForResource:@"Converged" ofType:@"txt"];
        if (fileName) {
            _descriptionString = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        }
        _descriptionLabel.text = _descriptionString;
    
    }
    if (i == 2) {
        NSString* fileName = [[NSBundle mainBundle] pathForResource:@"ScaleOut" ofType:@"txt"];
        if (fileName) {
            _descriptionString = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        }
        _descriptionLabel.text = _descriptionString;
        
    }
    if (i == 3) {
        NSString* fileName = [[NSBundle mainBundle] pathForResource:@"SoftwareDefined" ofType:@"txt"];
        if (fileName) {
            _descriptionString = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        }
        _descriptionLabel.text = _descriptionString;
    }
    if (i == 4) {
        NSString* fileName = [[NSBundle mainBundle] pathForResource:@"Flash" ofType:@"txt"];
        if (fileName) {
            _descriptionString = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        }
        _descriptionLabel.text = _descriptionString;
    }
    if (i == 5) {
        NSString* fileName = [[NSBundle mainBundle] pathForResource:@"Cloud" ofType:@"txt"];
        if (fileName) {
            _descriptionString = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        }
        _descriptionLabel.text = _descriptionString;
    }
    [_descriptionLabel fadeInWithDuration:0.5 delay:0.1];
}



@end
