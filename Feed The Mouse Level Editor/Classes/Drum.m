//
//  Drum.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-04-20.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import "Drum.h"

@implementation Drum

- (Drum*) initializeDrumAtX:(float) xLocation andY: (float)yLocation andAngle: (float)radAngle
{
    x = xLocation;
    y = yLocation;
    angle = radAngle;
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

- (bool) pointIsInside: (NSPoint)pt
{
    if (pt.x < x - 100)
        return false;
    if (pt.x > x + 100)
        return false;
    if (pt.y > y + 100)
        return false;
    if (pt.y < y - 100)
        return false;
    return true;
}
@end
