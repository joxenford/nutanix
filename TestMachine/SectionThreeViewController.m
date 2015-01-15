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
@property (strong) NSString* descriptionString;

@end

@implementation SectionThreeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.buttonArray = @[self.convergedButton, self.scaleOutButton, self.softwareDefinedButton, self.serverAttachedFlashButton, self.hybridButton];
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
            self.descriptionString = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        }
        self.descriptionLabel.text = self.descriptionString;
    
    }
    if (i == 2) {
        NSString* fileName = [[NSBundle mainBundle] pathForResource:@"ScaleOut" ofType:@"txt"];
        if (fileName) {
            self.descriptionString = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        }
        self.descriptionLabel.text = self.descriptionString;
        
    }
    if (i == 3) {
        NSString* fileName = [[NSBundle mainBundle] pathForResource:@"SoftwareDefined" ofType:@"txt"];
        if (fileName) {
            self.descriptionString = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        }
        self.descriptionLabel.text = self.descriptionString;
    }
    if (i == 4) {
        NSString* fileName = [[NSBundle mainBundle] pathForResource:@"Flash" ofType:@"txt"];
        if (fileName) {
            self.descriptionString = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        }
        self.descriptionLabel.text = self.descriptionString;
    }
    if (i == 5) {
        NSString* fileName = [[NSBundle mainBundle] pathForResource:@"Cloud" ofType:@"txt"];
        if (fileName) {
            self.descriptionString = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        }
        self.descriptionLabel.text = self.descriptionString;
    }
    [self.descriptionLabel fadeInWithDuration:0.5 delay:0.1];
}



@end
