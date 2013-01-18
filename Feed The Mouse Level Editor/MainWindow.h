//
//  MainWindow.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-12.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@interface MainWindow : NSView
{
    NSImage *image;
    float opacity;
    NSBezierPath *path;
    bool gear;
    CGPoint pt;
}
- (NSPoint)randomPoint;
- (void) addGear;
- (void) drawGear;
@property (assign) float opacity;
@property (strong) NSImage *image;
@end
