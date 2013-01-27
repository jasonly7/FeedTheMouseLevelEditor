//
//  Gear.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-18.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import "Gear.h"

@implementation Gear
- (Gear*) initializeGearAt:(float) xLocation and: (float) yLocation
{
    x = xLocation;
    y = yLocation;
    r = 87;
    return self;
}

- (int)getX
{
    return x;
}

- (int)getY
{
    return y;
}
@end
