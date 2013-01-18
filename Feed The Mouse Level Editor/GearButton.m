//
//  GearButton.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-06.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import "GearButton.h"

@implementation GearButton
@synthesize mainWin;
- (IBAction)addGear:(id)pId
{
    [mainWin addGear];
       NSLog(@"Hi there");
}
@end
