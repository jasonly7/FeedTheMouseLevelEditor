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
@synthesize scroller;
- (void) addGear
{
    NSPoint point = [self randomPoint];
    point.y += 234+scroller->scrollPosition.y;
    Gear *g = [[Gear alloc] initializeGearAt:point.x and:point.y];
    
    [gears addObject:g];
    [[NSApp mainWindow] makeKeyWindow];
}

- (void) drawGear
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"gear_blue.png" ofType:nil]];
    CIImage *ciImage = [[CIImage alloc] initWithContentsOfURL: url];
    NSImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
    NSImage *gearImage = [[NSImage alloc] initWithSize:[imageRep size]];
    [gearImage addRepresentation: imageRep];
    [self setImage:gearImage];
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
        gears = [[NSMutableArray alloc] initWithCapacity:10];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.

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
    
    for (int i = 0; i < [gears count]; i++)
    {
        Gear *gear = gears[i];
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"gear_blue.png" ofType:nil]];
        CIImage *ciImage = [[CIImage alloc] initWithContentsOfURL: url];
        NSImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
        NSImage *gearImage = [[NSImage alloc] initWithSize:[imageRep size]];
        [gearImage addRepresentation: imageRep];
        [self setImage:gearImage];
        [self setOpacity:1.0];
        if (image) {
            NSRect imageRect;
            imageRect.origin = CGPointMake(0,0);
            imageRect.size = [image size];
            NSRect drawingRect = imageRect;
            pt = CGPointMake(gear->x-87, gear->y-87);
            drawingRect.origin = pt;

            [image drawInRect:drawingRect
                     fromRect:imageRect
                    operation:NSCompositeSourceOver
                     fraction:opacity];
        }
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

- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint p = [theEvent locationInWindow];
    printf("before y: %f\n", p.y);
    p.y += 234+scroller->scrollPosition.y;
    printf("after y: %f\n", p.y);
    Gear *g;
    iSelectedGear = -1;
    for (int i = 0; i < [gears count]; i++)
    {
        g = (Gear*) [gears objectAtIndex:i];
        
        if ([g pointIsInside:p])
        {
            iSelectedGear = i;
        }
    }

}

- (void)mouseDragged:(NSEvent *)theEvent
{
    NSPoint p = [theEvent locationInWindow];
    p.y += 234+scroller->scrollPosition.y;
    if (iSelectedGear!=-1)
    {
        Gear *g = (Gear*) [gears objectAtIndex:iSelectedGear];
        g->x = p.x;
        g->y = p.y;
    }
}

-(void)mouseUp:(NSEvent *)theEvent
{
    NSPoint p = [theEvent locationInWindow];
    p.y += 234+scroller->scrollPosition.y;
    Gear *g;
    if ([gears count]>0 && iSelectedGear!=-1)
    {
        g = (Gear*) [gears objectAtIndex:iSelectedGear];
        g->x = p.x;
        g->y = p.y;
    }
}
@end
