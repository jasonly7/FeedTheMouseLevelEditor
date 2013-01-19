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
#import "Gear.h"
#import "CustomScrollView.h"

@interface MainWindow : NSView
{
    NSImage *image;
    float opacity;
    NSBezierPath *path;
    int iSelectedGear;
    CGPoint pt;
    NSMutableArray *gears;
    CustomScrollView *scroller;
}
- (NSPoint)randomPoint;
- (void) addGear;
- (void) drawGear;
@property (assign) float opacity;
@property (strong) NSImage *image;
@property (nonatomic, retain) IBOutlet CustomScrollView *scroller;
@end
