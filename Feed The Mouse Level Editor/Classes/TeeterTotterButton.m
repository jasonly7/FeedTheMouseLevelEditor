//
//  TeeterTotterButton.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2014-03-06.
//  Copyright (c) 2014 Jason Ly. All rights reserved.
//

#import "TeeterTotterButton.h"

@implementation TeeterTotterButton
@synthesize mainWin;
- (IBAction)addTeeterTotter:(id)sender
{
    [mainWin addTeeterTotter];
}
@end
