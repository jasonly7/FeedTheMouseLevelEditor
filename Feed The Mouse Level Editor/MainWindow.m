//
//  MainWindow.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-12.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import "MainWindow.h"
#import "Level.h"

#pragma mark Accessors

@implementation MainWindow
@synthesize scroller;
@synthesize cboLevel;
@synthesize lblCoordinates;

typedef enum toolMode
{
    MOVE,
    ROTATE
} ToolMode;

- (void) addDrum
{
    [[NSApp mainWindow] makeKeyWindow];
    NSPoint point = [self randomPoint];
    point.y += self.bounds.size.height - scroller.frame.size.height +scroller->scrollPosition.y-17;
    Drum *d = [[[Drum alloc] init] autorelease];
    [d initializeDrumAtX:point.x andY:point.y andAngle:0];
    [currentLevel addDrum:d];
    
    [self setNeedsDisplay:YES];
}

- (void) addTeeterTotter
{
    [[NSApp mainWindow] makeKeyWindow];
    NSPoint point = [self randomPoint];
    //point.y += 355+scroller->scrollPosition.y-17;
    TeeterTotter *t = [[[TeeterTotter alloc] init] autorelease];
    [t initializeTeeterTotterAtX:point.x andY: point.y];
    [currentLevel addTeeterTotter:t];
    
    [self setNeedsDisplay:YES];
}

- (void) addCoin
{
    [[NSApp mainWindow] makeKeyWindow];
    NSPoint point = [self randomPoint];
    //point.y += 355+scroller->scrollPosition.y-17;
    Coin *c = [[[Coin alloc] init] autorelease];
    [c initializeCoinAtX:point.x andY:point.y];
    [currentLevel addCoin:c];
    
    [self setNeedsDisplay:YES];
}

- (void) addFlipper
{
    [[NSApp mainWindow] makeKeyWindow];
    NSPoint point = [self randomPoint];
//    point.y += 355+scroller->scrollPosition.y-17;
    Flipper *f = [[[Flipper alloc] init] autorelease];
    [f initializeFlipperAtX:point.x andY: point.y andAngle:0];
    [currentLevel addFlipper:f];
    
    [self setNeedsDisplay:YES];
}

- (void) addGear
{
    [[NSApp mainWindow] makeKeyWindow];
    NSPoint point = [self randomPoint];
   // printf("scroll pos: (%f,%f)\n", scroller->scrollPosition.x, scroller->scrollPosition.y);
   // point.y += 355+scroller->scrollPosition.y-17;
    Gear *g = [[[Gear alloc] init] autorelease];
    [g initializeGearAt:point.x and:point.y];
    
    [currentLevel addGear:g];
    
    [self setNeedsDisplay:YES];
}

- (void) drawGear
{
    NSURL *url;
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"gear_blue.png" ofType:nil]];
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
    [gearImage release];
    [imageRep release];
    [ciImage release];
}

- (void) drawCoin
{
    NSURL *url;
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"coin.png" ofType:nil]];
    CIImage *ciImage = [[CIImage alloc] initWithContentsOfURL: url];
    NSImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
    NSImage *coinImage = [[NSImage alloc] initWithSize:[imageRep size]];
    [coinImage addRepresentation: imageRep];
    [self setImage:coinImage];
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
    [coinImage release];
    [imageRep release];
    [ciImage release];
}

- (void) drawDrum
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Drum.png" ofType:nil]];
    CIImage *ciImage = [[CIImage alloc] initWithContentsOfURL: url];
    NSImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
    NSImage *drumImage = [[NSImage alloc] initWithSize:[imageRep size]];
    [drumImage addRepresentation: imageRep];
    [self setImage:drumImage];
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
    [drumImage release];
    [imageRep release];
    [ciImage release];
}

- (void) drawFlipper
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"flipper_blue2.png" ofType:nil]];
    CIImage *ciImage = [[CIImage alloc] initWithContentsOfURL: url];
    NSImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
    NSImage *flipperImage = [[NSImage alloc] initWithSize:[imageRep size]];
    [flipperImage addRepresentation: imageRep];
    [self setImage:flipperImage];
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
    [flipperImage release];
    [imageRep release];
    [ciImage release];
}

- (void) drawTeeterTotter
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_totter.png" ofType:nil]];
    CIImage *ciImage = [[CIImage alloc] initWithContentsOfURL: url];
    NSImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
    NSImage *totterImage = [[NSImage alloc] initWithSize:[imageRep size]];
    [totterImage addRepresentation: imageRep];
    [self setImage:totterImage];
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
    [totterImage release];
    [imageRep release];
    [ciImage release];
}

// randomPoint returns a random point inside the view
- (NSPoint)randomPoint
{
	NSPoint result;
    NSRect r = [self bounds];
    printf("bounds %f %f %f %f\n",r.origin.x, r.origin.y,r.size.width, r.size.height);
    result.x = r.origin.x + random() % (int)r.size.width;
    result.y = r.origin.y + random() % ((int)r.size.height - 355 - 17 + 87);
    printf("random point is at (%f, %f)\n", result.x, result.y);
    return result;
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Seed the random number generator
        srandom((unsigned)time(NULL));
        currentLevel = [[Level alloc] init];
       // currentLevel->gears = [[NSMutableArray alloc] initWithCapacity:10];
        levels = [[NSMutableArray alloc] initWithCapacity:10];

        [currentLevel initializeLevel:(int)levels.count+1];

        [levels addObject:currentLevel];
        trackingArea = [[NSTrackingArea alloc] initWithRect:self.frame
                                                    options: (NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveInKeyWindow )
                                                      owner:self userInfo:nil];
        [self addTrackingArea:trackingArea];
        [self.window setAcceptsMouseMovedEvents:true];
    }
    
    return self;
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (void)keyUp:(NSEvent *)theEvent
{
    
    printf("bounds: %f\n", self.bounds.size.height);
    switch ( [theEvent keyCode] ) {
        case 51: // if delete key is pressed
        case 117:
            if (iSelectedDrum!=-1)
                [currentLevel->drums removeObjectAtIndex:iSelectedDrum];
            else if (iSelectedFlipper!=-1)
                [currentLevel->flippers removeObjectAtIndex:iSelectedFlipper];
            else if (iSelectedCoin!=-1)
                [currentLevel->coins removeObjectAtIndex:iSelectedCoin];
            else if (iSelectedGear!=-1)
                [currentLevel->gears removeObjectAtIndex:iSelectedGear];
            else if (iSelectedTotter!=-1)
                [currentLevel->teeterTotters removeObjectAtIndex:iSelectedTotter];
            break;
    }
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
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
        printf("drawing background rect with size: (%f,%f)", imageRect.size.width, imageRect.size.height);
        NSRect drawingRect = imageRect;
        [image drawInRect:drawingRect
                 fromRect:imageRect
                operation:NSCompositeSourceOver
                 fraction:opacity];
    }
    [imageRep release];
    [ciImage release];
    [backgroundImage release];
    
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"MouseWait.png" ofType:nil]];
    ciImage = [[CIImage alloc] initWithContentsOfURL: url];
    imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
    NSImage *mouseImage = [[NSImage alloc] initWithSize:[imageRep size]];
    [mouseImage addRepresentation: imageRep];
    [self setImage:mouseImage];
    mouse = currentLevel->mouse;
    NSAffineTransform *trans = [NSAffineTransform transform];

    [self setOpacity:1.0];
    if (!currentLevel->mouse)
    {
        currentLevel->mouse = [[Mouse alloc] init];
        [currentLevel->mouse initializeMouseAtX:500 andY:150];
    }
    if (image) {
        NSRect imageRect;
        imageRect.origin = CGPointMake(0,0);
        imageRect.size = [image size];
        NSRect drawingRect = imageRect;
        pt = CGPointMake(currentLevel->mouse->x-128, currentLevel->mouse->y-161);
        drawingRect.origin = pt;
        if (currentLevel->mouse->x < self.bounds.size.width/2)
        {
            [mouseImage lockFocus];
            [trans translateXBy:256 yBy:0];
            [trans scaleXBy:-1 yBy:1];
            [trans concat];
            [trans set];
            [image drawAtPoint:NSZeroPoint fromRect:NSMakeRect(0, 0,256,322) operation:NSCompositeCopy fraction:1.0];
            [mouseImage unlockFocus];
        }
        [image drawInRect:drawingRect
                 fromRect:imageRect
                operation:NSCompositeSourceOver
                 fraction:opacity];
    }
    [imageRep release];
    [ciImage release];
    [mouseImage release];

    
    for (int i = 0; i < [currentLevel->gears count]; i++)
    {
        Gear *gear = currentLevel->gears[i];
        NSURL *url = [gear getURL];
        
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
            printf("gear is at (%d, %d)\n", gear->x, gear->y);
            pt = CGPointMake(gear->x-87, gear->y-87);
            drawingRect.origin = pt;

            [image drawInRect:drawingRect
                     fromRect:imageRect
                    operation:NSCompositeSourceOver
                     fraction:opacity];
        }
        [imageRep release];
        [gearImage release];
        [ciImage release];
    }
    
    
    for (int i = 0; i < [currentLevel->coins count]; i++)
    {
        Coin *coin = currentLevel->coins[i];
        NSURL *url = [coin getURL];
        
        CIImage *ciImage = [[CIImage alloc] initWithContentsOfURL: url];
        NSImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
        NSImage *coinImage = [[NSImage alloc] initWithSize:[imageRep size]];
        [coinImage addRepresentation: imageRep];
        [self setImage:coinImage];
        [self setOpacity:1.0];
        if (image) {
            NSRect imageRect;
            imageRect.origin = CGPointMake(0,0);
            imageRect.size = [image size];
            NSRect drawingRect = imageRect;
            printf("coin is at (%d, %d)\n", coin->x, coin->y);
            pt = CGPointMake(coin->x - [coin getRadius] , coin->y - [coin getRadius]);
            drawingRect.origin = pt;
            
            [image drawInRect:drawingRect
                     fromRect:imageRect
                    operation:NSCompositeSourceOver
                     fraction:opacity];
        }
        [imageRep release];
        [coinImage release];
        [ciImage release];
    }

    
    
    for (int i = 0; i < [currentLevel->drums count]; i++)
    {
        Drum *drum = currentLevel->drums[i];
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Drum.png" ofType:nil]];
        CIImage *ciImage = [[CIImage alloc] initWithContentsOfURL: url];
        NSImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
        NSImage *drumImage = [[NSImage alloc] initWithSize:[imageRep size]];
        [drumImage addRepresentation: imageRep];
        [self setImage:drumImage];
        
        NSAffineTransform *trans = [NSAffineTransform transform];
        [self setOpacity:1.0];
        if (image) {
            NSImage *newImage = [[[NSImage alloc] initWithSize:image.size] autorelease];
            NSRect imageRect;
            imageRect.origin = CGPointMake(0,0);
            imageRect.size = [image size];
            
            NSRect drawingRect = imageRect;
            float halfDrumHeight = 37.0f/2.0f;
            pt = CGPointMake(drum->x-100, drum->y - 100);
            drawingRect.origin = pt;
            drawingRect.size.height = 400;
            drawingRect.size.width = 400;
            [newImage lockFocus];
            /**
             * Apply the following transformations:
             *
             * - bring the rotation point to the centre of the image instead of
             *   the default lower, left corner (0,0).
             * - rotate it by 90 degrees, either clock or counter clockwise.
             * - re-translate the rotated image back down to the lower left corner
             *   so that it appears in the right place.
             */
            [trans translateXBy:100 yBy:100];
            [trans rotateByDegrees:drum->angle];
            [trans translateXBy:-100 yBy:-100];
            [trans set];
            printf("image size is (%f, %f)\n", image.size.width, image.size.height);
            [image drawAtPoint:NSZeroPoint fromRect:NSMakeRect(0, 0,image.size.width,image.size.height) operation:NSCompositeCopy fraction:1];
            
            [newImage unlockFocus];
            [newImage drawInRect:drawingRect
                     fromRect:imageRect
                    operation:NSCompositeSourceOver
                     fraction:opacity];

        }

        [imageRep release];
        [drumImage release];
        [ciImage release];
    }
    
    for (int i = 0; i < [currentLevel->flippers count]; i++)
    {
        Flipper *flipper = currentLevel->flippers[i];
        NSURL *url = [flipper getURL];
        //[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"flipper_blue_level_editor.png" ofType:nil]];
        CIImage *ciImage = [[CIImage alloc] initWithContentsOfURL: url];
        NSImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
        NSImage *flipperImage = [[NSImage alloc] initWithSize:[imageRep size]];
        [flipperImage addRepresentation: imageRep];
        [self setImage:flipperImage];
        
        NSAffineTransform *trans = [NSAffineTransform transform];
        [self setOpacity:1.0];
        if (image) {
            NSImage *newImage = [[[NSImage alloc] initWithSize:image.size] autorelease];
            NSRect imageRect;
            imageRect.origin = CGPointMake(0,0);
            imageRect.size = [image size];
            
            NSRect drawingRect = imageRect;
            pt = CGPointMake(flipper->x-84, flipper->y-84);
            drawingRect.origin = pt;
            drawingRect.size.height = 336;
            drawingRect.size.width = 336;
            [newImage lockFocus];
            /**
             * Apply the following transformations:
             *
             * - bring the rotation point to the centre of the image instead of
             *   the default lower, left corner (0,0).
             * - rotate it by 90 degrees, either clock or counter clockwise.
             * - re-translate the rotated image back down to the lower left corner
             *   so that it appears in the right place.
             */
            
            [trans translateXBy:84 yBy:84];
            [trans rotateByDegrees:flipper->angle];
            [trans translateXBy:-84 yBy:-84];
            if (flipper->isImgFlipped)
            {
                [trans translateXBy:168 yBy:0];
                [trans scaleXBy:-1 yBy:1];
                [trans concat];
            }
            [trans set];
            [image drawAtPoint:NSZeroPoint fromRect:NSMakeRect(0, 0,168,168) operation:NSCompositeCopy fraction:1.0];
            
            [newImage unlockFocus];
            [newImage drawInRect:drawingRect
                        fromRect:imageRect
                       operation:NSCompositeSourceOver
                        fraction:opacity];
            
        }
        
        [imageRep release];
        [flipperImage release];
        [ciImage release];
    }

    
    for (int i = 0; i < [currentLevel->teeterTotters count]; i++)
    {
        TeeterTotter *teeterTotter = currentLevel->teeterTotters[i];
        NSURL *url = [teeterTotter getURL];
        //[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"teeter_totter.png" ofType:nil]];
        CIImage *ciImage = [[CIImage alloc] initWithContentsOfURL: url];
        NSImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCIImage:ciImage];
        NSImage *totterImage = [[NSImage alloc] initWithSize:[imageRep size]];
        [totterImage addRepresentation: imageRep];
        [self setImage:totterImage];
        
        NSAffineTransform *trans = [NSAffineTransform transform];
        [self setOpacity:1.0];
        if (image) {
            NSImage *newImage = [[[NSImage alloc] initWithSize:image.size] autorelease];
            NSRect imageRect;
            imageRect.origin = CGPointMake(0,0);
            imageRect.size = [image size];
            
            NSRect drawingRect = imageRect;
            pt = CGPointMake(teeterTotter->x-74, teeterTotter->y-74);
            drawingRect.origin = pt;
            drawingRect.size.height = 296;
            drawingRect.size.width = 296;
            [newImage lockFocus];
            /**
             * Apply the following transformations:
             *
             * - bring the rotation point to the centre of the image instead of
             *   the default lower, left corner (0,0).
             * - rotate it by 90 degrees, either clock or counter clockwise.
             * - re-translate the rotated image back down to the lower left corner
             *   so that it appears in the right place.
             */
            [trans translateXBy:74 yBy:74];
            //[trans rotateByDegrees:teeterTotter->angle];
            [trans translateXBy:-74 yBy:-74];
            [trans set];
            [image drawAtPoint:NSZeroPoint fromRect:NSMakeRect(0, 0,148,148) operation:NSCompositeCopy fraction:1.0];
            
            [newImage unlockFocus];
            [newImage drawInRect:drawingRect
                        fromRect:imageRect
                       operation:NSCompositeSourceOver
                        fraction:opacity];
            
        }
        
        [imageRep release];
        [totterImage release];
        [ciImage release];
    }
}

+ (NSImage *)rotate:(NSImage *)image byAngle:(int)degrees
{
    if (degrees == 0) {
        return image;
    } else {
        NSSize beforeSize = [image size];
        NSSize afterSize = degrees == 90 || degrees == -90 ? NSMakeSize(beforeSize.height, beforeSize.width) : beforeSize;
        NSImage* newImage = [[[NSImage alloc] initWithSize:afterSize] autorelease];
        NSAffineTransform* trans = [NSAffineTransform transform];
        
        [newImage lockFocus];
        [trans translateXBy:afterSize.width * 0.5 yBy:afterSize.height * 0.5];
        [trans rotateByDegrees:degrees];
        [trans translateXBy:-beforeSize.width * 0.5 yBy:-beforeSize.height * 0.5];
        [trans set];
        [image drawAtPoint:NSZeroPoint
                  fromRect:NSMakeRect(0, 0, beforeSize.width, beforeSize.height)
                 operation:NSCompositeCopy
                  fraction:1.0];
        [newImage unlockFocus];
        return newImage;
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

- (void)rightMouseDown:(NSEvent *)theEvent
{
    printf("right mouse clicked");
    Flipper *f;
    f = (Flipper*) [currentLevel->flippers objectAtIndex:iSelectedFlipper];
    f->isImgFlipped = !f->isImgFlipped;
}
- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint p = [theEvent locationInWindow];
    printf("before y: %f\n", p.y);
    p.y += self.bounds.size.height - scroller.frame.size.height + scroller->scrollPosition.y-17;
//        p.y += 374+scroller->scrollPosition.y-17;
    printf("after y: %f\n", p.y);
    Gear *g;
    Drum *d;
    TeeterTotter *t;
    Flipper *f;
    Coin *c;
    iSelectedCoin = -1;
    iSelectedGear = -1;
    iSelectedDrum = -1;
    iSelectedTotter = -1;
    iSelectedFlipper = -1;
    isMouseSelected = false;
    mouse = currentLevel->mouse;
    if ([mouse pointIsInside:p])
        isMouseSelected = true;
    for (int i = 0; i < [currentLevel->coins count]; i++)
    {
        c = (Coin*) [currentLevel->coins objectAtIndex:i];
        
        if ([c pointIsInside:p])
        {
            iSelectedCoin = i;
        }
    }
    for (int i = 0; i < [currentLevel->gears count]; i++)
    {
        g = (Gear*) [currentLevel->gears objectAtIndex:i];
        
        if ([g pointIsInside:p])
        {
            iSelectedGear = i;
        }
    }
    for (int i = 0; i < [currentLevel->drums count]; i++)
    {
        d = (Drum*) [currentLevel->drums objectAtIndex:i];
        
        if ([d pointIsInside:p])
        {
            iSelectedDrum = i;
        }
    }
    for (int i = 0; i < [currentLevel->teeterTotters count]; i++)
    {
        t = (TeeterTotter*) [currentLevel->teeterTotters objectAtIndex:i];
        
        if ([t pointIsInside:p])
        {
            iSelectedTotter = i;
        }
    }
    for (int i = 0; i < [currentLevel->flippers count]; i++)
    {
        f = (Flipper*) [currentLevel->flippers objectAtIndex:i];
        
        if ([f pointIsInside:p])
        {
            iSelectedFlipper = i;
        }
    }
    [self setNeedsDisplay:YES];
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    NSPoint p = [theEvent locationInWindow];
    p.y += self.bounds.size.height - scroller.frame.size.height-17+scroller->scrollPosition.y;
    if (isMouseSelected)
    {
        mouse->x = p.x;
        mouse->y = p.y;
    }
    if (iSelectedCoin!=-1)
    {
        Coin *c = (Coin*) [currentLevel->coins objectAtIndex:iSelectedCoin];
        c->x = p.x;
        c->y = p.y;
    }
    if (iSelectedGear!=-1)
    {
        Gear *g = (Gear*) [currentLevel->gears objectAtIndex:iSelectedGear];
        g->x = p.x;
        g->y = p.y;
    }
    if (iSelectedDrum!=-1)
    {
        Drum *d = (Drum*) [currentLevel->drums objectAtIndex:iSelectedDrum];
        d->x = p.x;
        d->y = p.y;
    }
    if (iSelectedTotter!=-1)
    {
        TeeterTotter *t = (TeeterTotter*) [currentLevel->teeterTotters objectAtIndex:iSelectedTotter];
        t->x = p.x;
        t->y = p.y;
    }
    if (iSelectedFlipper!=-1)
    {
        Flipper *f = (Flipper*) [currentLevel->flippers objectAtIndex:iSelectedFlipper];
        f->x = p.x;
        f->y = p.y;
    }
    [lblCoordinates setStringValue:[NSString stringWithFormat:@"%f,%f", p.x, p.y]];

    [self setNeedsDisplay:YES];
}

- (void)scrollWheel:(NSEvent *)theEvent
{
    NSLog(@"user scrolled %f vertically", [theEvent deltaY]);
    if (iSelectedDrum!=-1)
    {
        Drum *d = (Drum*) [currentLevel->drums objectAtIndex:iSelectedDrum];
        d->angle+= [theEvent deltaY];
    }
    if (iSelectedFlipper!=-1)
    {
        Flipper *f = (Flipper*) [currentLevel->flippers objectAtIndex:iSelectedFlipper];
        f->angle+= [theEvent deltaY];
    }
    [self setNeedsDisplay:YES];
}

-(void)mouseUp:(NSEvent *)theEvent
{
    NSPoint p = [theEvent locationInWindow];
    p.y += self.bounds.size.height - scroller.frame.size.height - 17+scroller->scrollPosition.y;
    Coin *c;
    Gear *g;
    Drum *d;
    TeeterTotter *t;
    Flipper *f;
    if (isMouseSelected)
    {
        mouse->x = p.x;
        mouse->y = p.y;
        isMouseSelected = false;
    }
    if ([currentLevel->coins count]>0 && iSelectedCoin!=-1)
    {
        c = (Coin*) [currentLevel->coins objectAtIndex:iSelectedCoin];
        c->x = p.x;
        c->y = p.y;
    }
    if ([currentLevel->gears count]>0 && iSelectedGear!=-1)
    {
        g = (Gear*) [currentLevel->gears objectAtIndex:iSelectedGear];
        g->x = p.x;
        g->y = p.y;
    }
    if ([currentLevel->drums count]>0 && iSelectedDrum!=-1)
    {
        d = (Drum*) [currentLevel->drums objectAtIndex:iSelectedDrum];
        d->x = p.x;
        d->y = p.y;
    }
    if ([currentLevel->teeterTotters count]>0 && iSelectedTotter!=-1)
    {
        t = (TeeterTotter*) [currentLevel->teeterTotters objectAtIndex:iSelectedTotter];
        t->x = p.x;
        t->y = p.y;
    }
    if ([currentLevel->flippers count]>0 && iSelectedFlipper!=-1)
    {
        f = (Flipper*) [currentLevel->flippers objectAtIndex:iSelectedFlipper];
        f->x = p.x;
        f->y = p.y;
    }

}

-(void)mouseMoved:(NSEvent *)theEvent
{
    NSPoint p = [theEvent locationInWindow];
    Drum *d;
    p.y += (self.bounds.size.height - scroller.frame.size.height) - 17 + scroller->scrollPosition.y;
    [lblCoordinates setStringValue:[NSString stringWithFormat:@"%f,%f", p.x, p.y]];
    /*if ([currentLevel->drums count]>0 && iSelectedDrum!=-1)
    {
        d = (Drum*) [currentLevel->drums objectAtIndex:iSelectedDrum];
        d->x = p.x;
        d->y = p.y;
    }*/
   
    [self setNeedsDisplay:YES];
}

- (void) addLevel
{
    Level *level = [[Level alloc] init];
    int iLevel = (int)levels.count+1;
    [level initializeLevel:iLevel];

    [levels addObject:level];

    NSString *strLevel = [NSString stringWithFormat:@"Level %d", (int)levels.count];
    [cboLevel addItemWithObjectValue:strLevel];
    [level release];
}

- (IBAction)cboLevelSelected:(id)sender
{
    //currentLevel->gears = gears; // save gears

    int selectedIndex = (int)[cboLevel indexOfSelectedItem];
        
    if (selectedIndex >= 0)
    {
        //levels[selectedIndex] = currentLevel;
        currentLevel = (Level*) [ levels objectAtIndex:selectedIndex];
       // gears = currentLevel->gears;
        curIndex = selectedIndex;
    }
    /*if (levels!= NULL)
    {
    Level *l =(Level*) [levels objectAtIndex:(0)];
    Gear *g = (Gear*) [l->gears objectAtIndex:0];
    printf("(x,y): (%d,%d)\n",g->x,g->y);
    }*/
        [self setNeedsDisplay:YES];
    printf("level %d\n", selectedIndex);
}

- (IBAction)save:(id)sender
{
    printf("saving");
    long result;
    
    
    
    NSSavePanel *sPanel = [NSSavePanel savePanel];
    
    result = [sPanel runModal];
    
    
    if ( result == NSOKButton) {
        NSURL *furl = [NSURL fileURLWithPath:[sPanel filename]];
        NSString *aFile = [sPanel filename];
        const char *szfile = [aFile UTF8String];
        printf("filename: %s\n",szfile);
        MyDocument *myDoc = [[MyDocument alloc] init];
        for (int i=0; i < levels.count; i++)
        {
            /*Level *curLevel = [levels objectAtIndex:i];
            for (int j=0; j <curLevel->gears.count; j++)
            {
                Gear *g =(Gear*) [curLevel->gears objectAtIndex:j];
                [myDoc addGear:[g getX] andY:[g getY]];
            }*/
            [myDoc addLevel:levels[i]];
        }
        NSError *err = nil;
        [myDoc writeToURL:furl ofType:@"xml" error:&err];
        [myDoc release];
    }
    
}

- (IBAction)open:(id)sender
{
    printf("opening");
    long result;
    
    NSOpenPanel *oPanel = [NSOpenPanel openPanel];
    
    result = [oPanel runModal];
    
    if ( result == NSOKButton) {
        NSURL *furl = [NSURL fileURLWithPath:[oPanel filename]];
        NSString *aFile = [oPanel filename];
        const char *szfile = [aFile UTF8String];
        printf("filename: %s\n",szfile);
        MyDocument *myDoc = [[MyDocument alloc] init];
       // for (int i=0; i < levels.count; i++)
        //{
          //              [myDoc addLevel:levels[i]];
        //}
        NSError *err = nil;
        //[myDoc writeToURL:furl ofType:@"xml" error:&err];
        NSData *data = [[NSData alloc] initWithContentsOfFile:aFile];
        [myDoc readFromData:data ofType:@"xml" error:&err];
        levels = myDoc->parser->levels;
        Level *l= (Level*)[levels objectAtIndex:0];
        printf("#of drums %ld\n", [l->drums count]);
        [cboLevel removeAllItems];
        for (int i=0; i < levels.count; i++)
        {
            NSString *strLevel = [NSString stringWithFormat:@"Level %d", (i+1)];
            [cboLevel addItemWithObjectValue:strLevel];
        }
        [myDoc release];
    }
}

- (IBAction)New:(id)sender
{
    [levels removeAllObjects];
    [cboLevel removeAllItems];
    currentLevel = [[Level alloc] init];

    levels = [[NSMutableArray alloc] initWithCapacity:10];
    
    [currentLevel initializeLevel:(int)levels.count+1];
    
    [levels addObject:currentLevel];
    NSString *strLevel = [NSString stringWithFormat:@"Level %d", (int)levels.count];
    [cboLevel addItemWithObjectValue:strLevel];
    [self setNeedsDisplay:YES];
}

- (void) changeColor:(id)sender
{
    NSColorPanel *cp = [NSColorPanel sharedColorPanel];
    
    if (iSelectedGear!=-1)
    {
        Gear *g = (Gear*) [currentLevel->gears objectAtIndex:iSelectedGear];
        [g setColor:cp.color];
    }
    else if (iSelectedTotter!=-1)
    {
        TeeterTotter *t = (TeeterTotter*) [currentLevel->teeterTotters objectAtIndex:iSelectedTotter];
        [t setColor:cp.color];
    }
    else if (iSelectedFlipper!=-1)
    {
        Flipper *f = (Flipper*) [currentLevel->flippers objectAtIndex:iSelectedFlipper];
        [f setColor:cp.color];
    }
    [self setNeedsDisplay:YES];
}
@end
