//
//  Mouse.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2014-05-02.
//  Copyright (c) 2014 Jason Ly. All rights reserved.
//

#import "Mouse.h"

@implementation Mouse

- (Mouse*) initializeMouseAtX:(float) xLocation andY: (float)yLocation
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
    if (pt.x < x - 128)
        return false;
    if (pt.x > x + 128)
        return false;
    if (pt.y > y + 161)
        return false;
    if (pt.y < y - 161)
        return false;
    return true;
}
@end
