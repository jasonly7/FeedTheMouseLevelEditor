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

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        // Initialization code here.
        opacity = 1.0;
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
/*    NSView *superview = [_window contentView];
    NSRect frame = NSMakeRect(10,10,200,100);
    

    NSButton *button = [[NSButton alloc] initWithFrame:frame];
    [button setTitle:@"Click Me"];
    [superview addSubview:button];*/
//    NSImage *gearImage = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gear_blue.png" ofType:nil]];
   // WinPicture *winPic = [WinPicture fromFile:@"gear_blue.png"];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"background_1.png" ofType:nil]];
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
