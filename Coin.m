//
//  Coin.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2015-01-24.
//  Copyright (c) 2015 Jason Ly. All rights reserved.
//

#import "Coin.h"

@implementation Coin

- (Coin*) initializeCoinAtX:(float)xLocation andY:(float)yLocation
{
    x = xLocation;
    y = yLocation;
    r = 29;
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

- (void)setX:(int)value
{
    x = value;
}

- (void)setY:(int)value
{
    y = value;
}

- (int)getRadius
{
    return r;
}

- (NSURL*) getURL
{
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"coin.png" ofType:nil]];
    return url;
}

@end
