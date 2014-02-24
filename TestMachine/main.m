//
//  main.m
//  TestMachine
//
//  Created by James Oxenford on 1/25/14.
//  Copyright (c) 2014 James Oxenford. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "NUISettings.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        [NUISettings init];
        [NUISettings setGlobalExclusions:@[@"UIWebView"]];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
