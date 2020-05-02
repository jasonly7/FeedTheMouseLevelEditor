//
//  Flipper.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2014-04-26.
//  Copyright (c) 2014 Jason Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flipper : NSObject
{
@public
    int x,y;
    float angle;
    bool isImgFlipped;
    NSColor *color;
    NSURL *url;
}

- (Flipper*) initializeFlipperAtX:(float) xLocation andY: (float)yLocation andAngle: (float)newAngle;
- (int)getX;
- (int)getY;
- (float)getAngle;
- (NSColor*) getColor;
- (NSString*) getStringColor;
- (NSURL*) getURL;
- (void) setX: (int) value;
- (void) setY: (int) value;
- (void) setAngle: (float) value;
- (void) setColor:(NSColor *)value;
- (bool) pointIsInside: (NSPoint)pt;
@end
