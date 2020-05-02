//
//  Mouse.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2014-05-02.
//  Copyright (c) 2014 Jason Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mouse : NSObject
{
@public
    int x,y;

}

- (Mouse*) initializeMouseAtX:(float) xLocation andY: (float)yLocation;
- (int)getX;
- (int)getY;
- (void) setX: (int) value;
- (void) setY: (int) value;

- (bool) pointIsInside: (NSPoint)pt;

@end
