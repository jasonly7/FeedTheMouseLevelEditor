//
//  ColorCombo.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2020-07-11.
//  Copyright © 2020 Jason Ly. All rights reserved.
//

#import "ColorCombo.h"

@implementation ColorCombo

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (IBAction)pickColor:(id)sender
{
    printf("picked color");
   // NSInteger *colorIndex = [self indexOfSelectedItem];
    //if (!colorIndex)
       // printf(@"picked %d", colorIndex);

   
}
- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder: coder]) {
        [self removeAllItems];
        [self addItemWithObjectValue:@"Orange"];
        [self addItemWithObjectValue:@"Blue"];
        [self addItemWithObjectValue:@"Purple"];
        [self addItemWithObjectValue:@"Red"];
        [self addItemWithObjectValue:@"Green"];
        [self addItemWithObjectValue:@"Magenta"];
        [self addItemWithObjectValue:@"Yellow"];
    }
    return self;
}

- (IBAction)colorPick:(id)sender {
    //int colorIndex = self.indexOfSelectedItem;
    colorSelected = self.stringValue;
    NSLog(colorSelected );
    //int color = strcmp(colorSelected, "Orange");
    //printf(@"is color orange: @d",color);
    if (colorSelected==@"Orange")
    {
        NSLog(@"Orange selected");
        int gearIndex = self->_mainWindow->iSelectedGear;
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        if (gearIndex > -1)
        {
            Gear *gear = [self->_mainWindow->currentLevel->gears objectAtIndex:gearIndex];
            [gear setColor:[NSColor orangeColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
        if (flipperIndex > -1)
        {
            Flipper *flipper = [self->_mainWindow->currentLevel->flippers objectAtIndex:flipperIndex];
            [flipper setColor:[NSColor orangeColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if (colorSelected==@"Blue")
    {
        NSLog(@"Blue selected");
        int gearIndex = self->_mainWindow->iSelectedGear;
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        if (gearIndex > -1)
        {
            Gear *gear = [self->_mainWindow->currentLevel->gears objectAtIndex:gearIndex];
            [gear setColor:[NSColor blueColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
        if (flipperIndex > -1)
        {
            Flipper *flipper = [self->_mainWindow->currentLevel->flippers objectAtIndex:flipperIndex];
            [flipper setColor:[NSColor blueColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if (colorSelected==@"Purple")
    {
        NSLog(@"Blue selected");
        int gearIndex = self->_mainWindow->iSelectedGear;
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        if (gearIndex > -1)
        {
            Gear *gear = [self->_mainWindow->currentLevel->gears objectAtIndex:gearIndex];
            [gear setColor:[NSColor purpleColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
        if (flipperIndex > -1)
        {
            Flipper *flipper = [self->_mainWindow->currentLevel->flippers objectAtIndex:flipperIndex];
            [flipper setColor:[NSColor purpleColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if (colorSelected==@"Red")
    {
        NSLog(@"Red selected");
        int gearIndex = self->_mainWindow->iSelectedGear;
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        if (gearIndex > -1)
        {
            Gear *gear = [self->_mainWindow->currentLevel->gears objectAtIndex:gearIndex];
            [gear setColor:[NSColor redColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
        if (flipperIndex > -1)
        {
            Flipper *flipper = [self->_mainWindow->currentLevel->flippers objectAtIndex:flipperIndex];
            [flipper setColor:[NSColor redColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if (colorSelected==@"Green")
    {
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        if (flipperIndex > -1)
        {
            Flipper *flipper = [self->_mainWindow->currentLevel->flippers objectAtIndex:flipperIndex];
            [flipper setColor:[NSColor greenColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if (colorSelected==@"Green")
    {
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        if (flipperIndex > -1)
        {
            Flipper *flipper = [self->_mainWindow->currentLevel->flippers objectAtIndex:flipperIndex];
            [flipper setColor:[NSColor greenColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if (colorSelected==@"Magenta")
    {
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        if (flipperIndex > -1)
        {
            Flipper *flipper = [self->_mainWindow->currentLevel->flippers objectAtIndex:flipperIndex];
            [flipper setColor:[NSColor magentaColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if (colorSelected==@"Yellow")
    {
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        if (flipperIndex > -1)
        {
            Flipper *flipper = [self->_mainWindow->currentLevel->flippers objectAtIndex:flipperIndex];
            [flipper setColor:[NSColor yellowColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
}

- (IBAction)selectText:(id)sender {
    NSInteger *colorIndex = [self indexOfSelectedItem];
    printf(@"picked %d", colorIndex);
}

@end
