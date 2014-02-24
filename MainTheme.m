#import "MainTheme.h"
#import <objc/message.h>
#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>


enum {
    STYLE_SPEC_TARGET = 0,
    STYLE_SPEC_METHOD,
    STYLE_SPEC_ARG1,
    STYLE_SPEC_ARG2
};


#define STYLE_TYPE_FLOAT @"float:"
#define STYLE_TYPE_BOOL @"bool:"
#define STYLE_TYPE_SIZE @"size:"
#define STYLE_TYPE_INT @"int:"
#define STYLE_TYPE_FONT @"font:"
#define STYLE_TYPE_COLOR @"color:"

#define THEME_APPLY_PREFIX @"themeApply"

#define DEFAULT_FONT_SIZE 12.0f

@implementation MainTheme

static NSDictionary *styleCache;

+ (void) initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        styleCache = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DefaultTheme" ofType:@"plist"]];        
    });
}

- (void) applyThemeForStyleType:(NSString *)styleType to:(id)object
{
    SEL selector = NSSelectorFromString([self selectorNameFromStyleType: styleType]);
    void(*callSelector)(id, SEL, id) = (void(*)(id, SEL, id))objc_msgSend;
    
    // If there is already a selector there, call it
    // otherwise create it, then call it
    if (![self respondsToSelector:selector]) {
        [self createStyleSelector:styleType];
    }
    // FIXME
    // This should really throw if the selector deosn't exist, but
    // While I'm building this out it's useful to fail gracefully
    if ([self respondsToSelector:selector]) {
        callSelector(self, selector, object);
    }
    
}

- (void) createStyleSelector:(NSString *)styleType
{
    NSMutableArray *applierBlocks = [NSMutableArray arrayWithCapacity:2];
    NSArray *styleInfo = [[styleCache objectForKey:@"StyleTypes"] objectForKey:styleType];
    void(^tweak)(id) = nil;
    
    // Create a block for applying each style, and push each block into a list
    for (NSString *styleSpec in styleInfo) {
        tweak = [self buildTweakForStyleSpec:[styleSpec copy]];
        [applierBlocks addObject:tweak];
    }
    
    // If we had any valid styles defined
    if ([applierBlocks count]) {
        
        // Create a new method to apply each style in the list
        __block NSArray *blocklist = [applierBlocks copy];
        SEL applierSelector = NSSelectorFromString([self selectorNameFromStyleType:styleType]);
        IMP applierMethod = imp_implementationWithBlock(^(id _self, id target) {
            for(void(^applyStyle)(id) in blocklist) {
                applyStyle(target);
            }
        });
        // add it to this class
        class_addMethod(self.class, applierSelector, applierMethod, "v@::");
    }
}

- (NSString *) selectorNameFromStyleType:(NSString *)styleType
{
    return [NSString stringWithFormat:@"%@%@:",THEME_APPLY_PREFIX, styleType];
}


- (void (^)(id)) buildTweakForStyleSpec:(const __strong NSString *)styleSpec
{
    NSArray *specs = [styleSpec componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    void(^block)(id) = nil;
    
    if ([specs[STYLE_SPEC_METHOD] isEqualToString:@"customGradient"]) {
        block = ^(id target){
            id styledObject = ([specs[STYLE_SPEC_TARGET] hasPrefix:@"."] ? target : [target valueForKeyPath:specs[0]]);
            UIColor *from = [self styleValueFromSpec:specs[STYLE_SPEC_ARG1]];
            UIColor *to = [self styleValueFromSpec:specs[STYLE_SPEC_ARG2]];
            
            [self themeCustomGradientFromColor:from toColor:to for:styledObject];
        };
    } else if ([specs[STYLE_SPEC_METHOD] isEqualToString:@"customTitleColor"]) {
        block = ^(id target){
            id styledObject = ([specs[STYLE_SPEC_TARGET] hasPrefix:@"."] ? target : [target valueForKeyPath:specs[0]]);
            [self themeCustomTitleColor:[self styleValueFromSpec:specs[STYLE_SPEC_ARG1]] to:styledObject forState:specs[STYLE_SPEC_ARG2]];
        };
        
    // Handle generic specification of "object selector value"
    } else if ([specs count] >= 3) {
        block = ^(id target){
            [self applyGenericStyle:specs for:target];
        };
    } else {
        @throw ([NSException exceptionWithName:@"Invalid style argument" reason:@"bad value" userInfo:@{@"Value" :styleSpec}]);
    }
    return block;
}

- (void)createAndApplyStyleSelector:(NSString *)styleType to:(id)object
{
    NSMutableArray *applierBlocks = [NSMutableArray arrayWithCapacity:2];
    NSArray *styleInfo = [[styleCache objectForKey:@"StyleTypes"] objectForKey:styleType];
    void(^tweak)(id) = nil;
    
    // Create a block for applying each style, and push each block into a list
    for (NSString *styleSpec in styleInfo) {
        tweak = [self buildTweakForStyleSpec:[styleSpec copy]];
        [applierBlocks addObject:tweak];
    }
    
    // If we had any valid styles defined
    if ([applierBlocks count]) {
        
        // Create a new method to apply each style in the list
        __block NSArray *blocklist = [applierBlocks copy];
        SEL applierSelector = NSSelectorFromString([self selectorNameFromStyleType:styleType]);
        IMP applierMethod = imp_implementationWithBlock(^(id _self, id target) {
            for(void(^applyStyle)(id) in blocklist) {
                applyStyle(target);
            }
        });
        // add it to this class
        class_addMethod(self.class, applierSelector, applierMethod, "v@::");
        
        // Invoke the new method
        void(*callSelector)(id, SEL, id) = (void(*)(id, SEL, id))objc_msgSend;
        callSelector(self,NSSelectorFromString([self selectorNameFromStyleType:styleType]),object);
    }
}


- (void)applyGenericStyle:(NSArray *)specs for:(id)target {
    id styledObject = ([specs[STYLE_SPEC_TARGET] hasPrefix:@"."] ? target : [target valueForKeyPath:specs[STYLE_SPEC_TARGET]]);
    
    SEL selector = NSSelectorFromString(specs[STYLE_SPEC_METHOD]);
    NSString *styleValueSpec = specs[STYLE_SPEC_ARG1];
    
    // Is the argument is an objective C object?
    id argumentObject = [self styleValueFromSpec:styleValueSpec];
    if (argumentObject) {
        void(*callSelector)(id, SEL, id) = (void(*)(id, SEL, id))objc_msgSend;
        // we can use a generic template
        callSelector(styledObject, selector, argumentObject);
        // Is the argument a float?
    } else if ([styleValueSpec hasPrefix:STYLE_TYPE_FLOAT]) {
        float floatArg = [[styleValueSpec substringFromIndex:[STYLE_TYPE_FLOAT length]] floatValue];
        // We need to cast it to a float
        void(*callSelector)(id, SEL, float) = (void(*)(id, SEL, float))objc_msgSend;
        callSelector(styledObject, selector, floatArg);
    } else if ([styleValueSpec hasPrefix:STYLE_TYPE_INT]) {
        float intArg = [[styleValueSpec substringFromIndex:[STYLE_TYPE_INT length]] intValue];
        void(*callSelector)(id, SEL, int) = (void(*)(id, SEL, int))objc_msgSend;
        // Same with an int
        callSelector(styledObject, selector, intArg);
    } else {
        @throw ([NSException exceptionWithName:@"Invalid style spec" reason:@"style spec invalid" userInfo:@{@"Value" :specs}]);
    }
    NSLog(@"styleSpec: %@, target: %@ [%@]", specs, target, argumentObject);
}

- (id)styleValueFromSpec:(NSString *)styleValueSpec
{
    NSArray *typeValues = [styleValueSpec componentsSeparatedByString:@":"];
    id returnValue = nil;
    
    if ([styleValueSpec hasPrefix:STYLE_TYPE_COLOR] ) {
        returnValue = [self colorNamed:typeValues[1]];
    } else if ([styleValueSpec hasPrefix:STYLE_TYPE_FONT]) {
        returnValue = [self fontNamed:typeValues[1]];
    }
    return returnValue;
}

- (void)themeCustomGradientFromColor:(UIColor *)from toColor:(UIColor *)to for:(UIView *)target
{
    // create a CAGradientLayer to draw the gradient on
    CAGradientLayer* layer = [CAGradientLayer layer];
    
    // create the colors for our gradient based on the color passed in
    layer.colors = @[(id)[from CGColor],
                     (id)[to CGColor]
                     ];
    
    // create the color stops for our gradient
    layer.locations = @[
                        @(0.0f),
                        @(1.0f),
                        ];
    
    layer.frame = target.bounds;
    [layer setCornerRadius: 5.0f];
    [target.layer insertSublayer:layer atIndex:0];
}

- (UIFont *)fontNamed:(NSString *)fontName
{
    NSDictionary *fontInfo = [[styleCache objectForKey:@"Fonts"] objectForKey:fontName];
    NSString *name = [fontInfo objectForKey:@"FontName"];
    float fontSize = [[fontInfo objectForKey:@"FontSize"] floatValue];
    fontSize = (0 == fontSize ? DEFAULT_FONT_SIZE : fontSize);
    UIFont *font = nil;
    if (name && fontSize) {
        font = [UIFont fontWithName:name size:fontSize];
    } else {
        @throw ([NSException exceptionWithName:@"Invalid font name" reason:@"bad value" userInfo:@{@"Name":fontName}]);
        
    }
    return font;
}

- (UIColor*) builtinConvenienceColorWithName:(NSString*)name
{
    SEL selector = NSSelectorFromString([name stringByAppendingString:@"Color"]);
    if ([UIColor respondsToSelector:selector]) {
        return [UIColor performSelector:selector];
    } else {
        return nil;
    }
}

- (UIColor *)colorNamed:(NSString *)colorName
{
    UIColor *newColor = [self builtinConvenienceColorWithName:colorName];
    if (!newColor) {
        NSDictionary *colorInfo = [[styleCache objectForKey:@"Colors"] objectForKey:colorName];
        if (colorInfo) {
            float red = [[colorInfo objectForKey:@"Red"] floatValue];
            float green = [[colorInfo objectForKey:@"Green"] floatValue];
            float blue = [[colorInfo objectForKey:@"Blue"] floatValue];
            float alpha = [[colorInfo objectForKey:@"Alpha"] floatValue];
            newColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        }
    }
    if (!newColor) {
        @throw ([NSException exceptionWithName:@"Invalid color" reason:@"bad value" userInfo:@{@"Name:":colorName}]);
    }
    return newColor;
}

- (void)themeCustomTitleColor:(UIColor *)color to:(id)object forState:(NSString *)stateName
{
    NSDictionary *constantMap = @{
                                  @"normal": @(UIControlStateNormal),
                                  @"highlighted": @(UIControlStateHighlighted),
                                  @"disabled": @(UIControlStateDisabled),
                                  @"selected": @(UIControlStateSelected),
                                  @"application": @(UIControlStateApplication),
                                  @"reserved": @(UIControlStateReserved)
                                  };
    NSNumber *stateNumber = [constantMap objectForKey:stateName];
    if (stateNumber) {
        [object setTitleColor:color forState:[stateNumber intValue]];
    } else {
        @throw ([NSException exceptionWithName:@"Invalid object state constant" reason:@"bad value" userInfo:@{@"Name":stateName}]);
    }
}

@end
