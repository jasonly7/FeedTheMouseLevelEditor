//
//  Drum.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-04-20.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Drum : NSObject
{
@public
    int x,y;
    float angle;
}

- (Drum*) initializeDrumAtX:(float) xLocation andY: (float)yLocation andAngle: (float)radAngle;
- (int)getX;
- (int)getY;
- (float)getAngle;
- (void) setX: (int) value;
- (void) setY: (int) value;
- (void) setAngle: (float) value;
- (bool) pointIsInside: (NSPoint)pt;
@end
