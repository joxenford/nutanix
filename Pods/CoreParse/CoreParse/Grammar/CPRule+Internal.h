//
//  CPRule+Internal.h
//  CoreParse
//
//  Created by Tom Davie on 18/08/2012.
//  Copyright (c) 2012 In The Beginning... All rights reserved.
//

#import <CoreParse/CoreParse.h>

@interface CPRule (Internal)

- (BOOL)shouldCollapse;
- (void)setShouldCollapse:(BOOL)shouldCollapse;

- (NSString *)tagName;
- (void)setTagName:(NSString *)tagName;

@end
