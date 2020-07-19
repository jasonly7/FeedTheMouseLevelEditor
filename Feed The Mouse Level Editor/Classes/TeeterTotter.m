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
    else if (color == [NSColor redColor])
        return @"red";
    else if (color == [NSColor purpleColor])
        return @"purple";
    else if (color == [NSColor yellowColor])
        return @"yellow";
    else if (color == [NSColor orangeColor])
        return @"orange";
    else if (color == [NSColor grayColor])
        return @"gray";
}

- (void) setColor:(NSColor *)value
{
    color = value;
}

- (NSURL*) getURL
{
    if (color == [NSColor purpleColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_totter_purple.png" ofType:nil]];
    else if (color == [NSColor orangeColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_totter_orange.png" ofType:nil]];
    else if (color == [NSColor yellowColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_totter_yellow.png" ofType:nil]];
    else if (color == [NSColor greenColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_totter_green.png" ofType:nil]];
    else if (color == [NSColor grayColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_totter_grey.png" ofType:nil]];
    else if (color == [NSColor redColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_totter_red.png" ofType:nil]];
    else if (color == [NSColor blueColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_totter_blue.png" ofType:nil]];
    else
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_totter.png" ofType:nil]];
    return url;
}

@end
