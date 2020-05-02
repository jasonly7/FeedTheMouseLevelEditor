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

- (NSColor*) getColor
{
    return color;
}

- (NSString*) getStringColor
{
    if (color == [NSColor blueColor])
        return @"blue";
    else if (color == [NSColor greenColor])
        return @"green";
    else if (color == [NSColor magentaColor])
        return @"magenta";
    else if (color == [NSColor purpleColor])
        return @"purple";
    else if (color == [NSColor yellowColor])
        return @"yellow";
    else
        return @"orange";
}

- (NSURL*) getURL
{
    if ([self getColor] == [NSColor purpleColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"gear_purple.png" ofType:nil]];
    else if (color == [NSColor orangeColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"gear_orange.png" ofType:nil]];
    else if (color == [NSColor redColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"gear_red.png" ofType:nil]];
    else
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"gear_blue.png" ofType:nil]];
    return url;
}

- (void) setX: (int) value;
{
    x = value;
}

- (void) setY: (int) value
{
    y = value;
}

- (void) setColor:(NSColor *)value
{
    color = value;
}

@end
