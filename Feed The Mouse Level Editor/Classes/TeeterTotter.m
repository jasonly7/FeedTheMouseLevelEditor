//
//  TeeterTotter.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2014-03-06.
//  Copyright (c) 2014 Jason Ly. All rights reserved.
//

#import "TeeterTotter.h"

@implementation TeeterTotter

- (TeeterTotter*) initializeTeeterTotterAtX:(float) xLocation andY: (float)yLocation
{
    x = xLocation;
    y = yLocation;
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

- (void) setX: (int) value
{
    x = value;
}

- (void) setY: (int) value
{
    y = value;
}

- (bool) pointIsInside: (NSPoint)pt
{
    if (pt.x < x - 74)
        return false;
    if (pt.x > x + 74)
        return false;
    if (pt.y > y + 10)
        return false;
    if (pt.y < y - 10)
        return false;
    return true;
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

- (void) setColor:(NSColor *)value
{
    color = value;
}

- (NSURL*) getURL
{
    /*if (color == [NSColor purpleColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_purple.png" ofType:nil]];
    else if (color == [NSColor orangeColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_orange.png" ofType:nil]];
    else if (color == [NSColor yellowColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_yellow.png" ofType:nil]];
    else if (color == [NSColor greenColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_green.png" ofType:nil]];
    else*/
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_totter.png" ofType:nil]];
    return url;
}

@end
