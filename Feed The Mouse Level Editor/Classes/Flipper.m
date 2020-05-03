//
//  Flipper.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2014-04-26.
//  Copyright (c) 2014 Jason Ly. All rights reserved.
//

#import "Flipper.h"

@implementation Flipper

- (Flipper*) initializeFlipperAtX:(float) xLocation andY: (float)yLocation andAngle: (float)newAngle
{
    x = xLocation;
    y = yLocation;
    angle = newAngle;
    isImgFlipped = false;
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

- (float)getAngle
{
    return angle;
}

- (void) setX: (int) value
{
    x = value;
}

- (void) setY: (int) value
{
    y = value;
}

- (void) setAngle: (float) value
{
    angle = value;
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

- (bool) pointIsInside: (NSPoint)pt
{
    if (pt.x < x - 74)
        return false;
    if (pt.x > x + 74)
        return false;
    if (pt.y > y + 74)
        return false;
    if (pt.y < y - 74)
        return false;
    return true;
}

- (NSURL*) getURL
{
    if ([self getColor] == [NSColor blueColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"flipper_blue_level_editor.png" ofType:nil]];
    else if (color == [NSColor greenColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"flipper_green_level_editor.png" ofType:nil]];
    else if (color == [NSColor magentaColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"flipper_magenta_level_editor.png" ofType:nil]];
    else if (color == [NSColor purpleColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
            pathForResource:@"flipper_purple_level_editor.png" ofType:nil]];
    else if (color == [NSColor yellowColor])
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
            pathForResource:@"flipper_yellow_level_editor.png" ofType:nil]];
    else
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"flipper_orange_level_editor.png" ofType:nil]];
    return url;
}

@end
