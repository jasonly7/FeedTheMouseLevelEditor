//
//  FlipperButton.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2014-04-26.
//  Copyright (c) 2014 Jason Ly. All rights reserved.
//

#import "FlipperButton.h"

@implementation FlipperButton
@synthesize mainWin;
- (IBAction)addFlipper:(id)sender
{
    [mainWin addFlipper];
}@end
