//
//  MasterViewController.h
//  TestMachine
//
//  Created by James Oxenford on 1/25/14.
//  Copyright (c) 2014 James Oxenford. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
