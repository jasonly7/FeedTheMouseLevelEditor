//
//  DrumButton.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-04-20.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import "DrumButton.h"

@implementation DrumButton
@synthesize mainWin;
- (IBAction)addDrum:(id)sender
{
    [mainWin addDrum];
}
@end
