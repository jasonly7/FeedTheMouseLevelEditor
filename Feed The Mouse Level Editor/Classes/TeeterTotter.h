//
//  TeeterTotter.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2014-03-06.
//  Copyright (c) 2014 Jason Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeeterTotter : NSObject
{
    @public
    int x,y;
    NSURL *url;
    NSColor *color;
}

- (TeeterTotter*) initializeTeeterTotterAtX:(float) xLocation andY: (float)yLocation;
- (int)getX;
- (int)getY;
- (NSColor*)getColor;
- (NSString*)getStringColor;
- (NSURL*)getURL;
- (void) setX: (int) value;
- (void) setY: (int) value;
- (void) setColor: (NSColor*) color;
- (bool) pointIsInside: (NSPoint)pt;
@end
