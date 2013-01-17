//
//  MainWindow.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-12.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import "MainWindow.h"
#pragma mark Accessors

@implementation MainWindow

// randomPoint returns a random point inside the view
- (NSPoint)randomPoint
{
	NSPoint result;
    NSRect r = [self bounds];
    result.x = r.origin.x + random() % (int)r.size.width;
    result.y = r.origin.y + random() % (int)r.size.height;
    return result;
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Seed the random number generator
        srandom((unsigned)time(NULL));
        // Create a path object
        path = [NSBezierPath bezierPath];
        [path setLineWidth:3.0];
        NSPoint p = [self randomPoint];
        [path moveToPoint:p];
        int i;
        for (i = 0; i < 15; i++)
		{
			[path curveToPoint:[self randomPoint]
				 controlPoint1:[self randomPoint]
				 controlPoint2:[self randomPoint]];
        }
        [path closePath];
        // Initialization code here.
       // opacity = 1.0;
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
   /* NSRect bounds = [self bounds];
	// Fill the view with green
	[[NSColor greenColor] set];
	[NSBezierPath fillRect: bounds];
	// Draw the path in white
	[[NSColor whiteColor] set];
	//[path stroke];
    NSView *superview = [_window contentView];*/
   /* NSRect frame = NSMakeRect(10,10,200,100);
    

    NSButton *button = [[NSButton alloc] initWithFrame:frame];
    [button setTitle:@"Click Me"];
    [superview addSubview:button];*/
//    NSImage *gearImage = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gear_blue.png" ofType:nil]];
   // WinPicture *winPic = [WinPicture fromFile:@"gear_blue.png"];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"background_1.png" ofType:nil]];
    CIImage *ciImage = [[CIImage alloc] initWithContentsOfURL: url];
    NSImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
    NSImage *backgroundImage = [[NSImage alloc] initWithSize:[imageRep size]];
    [backgroundImage addRepresentation: imageRep];
    [self setImage:backgroundImage];
    [self setOpacity:1.0];
    if (image) {
        NSRect imageRect;
        imageRect.origin = CGPointMake(0,0);
        imageRect.size = [image size];
        NSRect drawingRect = imageRect;
        [image drawInRect:drawingRect
                 fromRect:imageRect
                operation:NSCompositeSourceOver
                 fraction:opacity];
    }
    
}

- (NSImage *)image
{
    return image;
}

- (void) setImage:(NSImage *)newImage
{
    image = newImage;
    [self setNeedsDisplay:YES];
}

- (float)opacity
{
    return opacity;
}

- (void)setOpacity:(float)x
{
    opacity = x;
    [self setNeedsDisplay:YES];
}
@end
