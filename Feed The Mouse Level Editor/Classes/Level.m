//
//  Level.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-03-24.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import "Level.h"

@implementation Level
- (void) initializeLevel:(int) number
{
    num = number;
    gears = [[NSMutableArray alloc] initWithCapacity:10];
    drums = [[NSMutableArray alloc] initWithCapacity:10];
    teeterTotters = [[NSMutableArray alloc] initWithCapacity:10];
    flippers = [[NSMutableArray alloc] initWithCapacity:10];
    coins = [[NSMutableArray alloc] initWithCapacity:10];
    mouse = [[Mouse alloc] init];
    [mouse initializeMouseAtX:500 andY:150];
}

-(void) setMouse:(Mouse *)m
{
    mouse = m;
}

-(void) addGear:(Gear*) g
{
    [gears addObject:g];
}

-(void) addCoin:(Coin*) c
{
    [coins addObject:c];
}

-(void) addDrum:(Drum*) d
{
    [drums addObject:d];
}

-(void) addTeeterTotter:(TeeterTotter *)t
{
    [teeterTotters addObject:t];
}

-(void) addFlipper:(Flipper *)f
{
    [flippers addObject:f];
}

@end
