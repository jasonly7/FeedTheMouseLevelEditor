//
//  ColorCombo.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2020-07-11.
//  Copyright © 2020 Jason Ly. All rights reserved.
//

#import "ColorCombo.h"

@implementation ColorCombo

- (BOOL)acceptsFirstResponder
{
    int gearIndex = 0;
    int flipperIndex = 0;
    int teeterTotterIndex = 0;
    [self removeAllItems];
    if (self->_mainWindow!=nil)
    {
        if (self->_mainWindow->iSelectedGear!=nil)
            gearIndex =  self->_mainWindow->iSelectedGear;
        if (self->_mainWindow->iSelectedFlipper!=nil)
            flipperIndex = self->_mainWindow->iSelectedFlipper;
        if (self->_mainWindow->iSelectedTotter!=nil)
            teeterTotterIndex = self->_mainWindow->iSelectedTotter;
        if (gearIndex > -1)
        {
            [self addItemWithObjectValue:@"Blue"];
            [self addItemWithObjectValue:@"Orange"];
            [self addItemWithObjectValue:@"Purple"];
            [self addItemWithObjectValue:@"Red"];
        }
        else if (flipperIndex > -1)
        {
            [self addItemWithObjectValue:@"Blue"];
            [self addItemWithObjectValue:@"Orange"];
            [self addItemWithObjectValue:@"Purple"];
            [self addItemWithObjectValue:@"Green"];
            [self addItemWithObjectValue:@"Magenta"];
            [self addItemWithObjectValue:@"Yellow"];
        }
        else if (teeterTotterIndex > -1)
        {
            [self addItemWithObjectValue:@"Blue"];
            [self addItemWithObjectValue:@"Orange"];
            [self addItemWithObjectValue:@"Purple"];
            [self addItemWithObjectValue:@"Green"];
            [self addItemWithObjectValue:@"Red"];
            [self addItemWithObjectValue:@"Yellow"];
        }
    }
    
    return YES;
}

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
    if ([colorSelected isEqualToString:@"Orange"])
    {
        NSLog(@"Orange selected");
        int gearIndex = self->_mainWindow->iSelectedGear;
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        int teeterTotterIndex = self->_mainWindow->iSelectedTotter;
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
        if (teeterTotterIndex > -1)
        {
            TeeterTotter *teeterTotter = [self->_mainWindow->currentLevel->teeterTotters objectAtIndex:teeterTotterIndex];
            [teeterTotter setColor:[NSColor orangeColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if ([colorSelected isEqualToString:@"Blue"])//(colorSelected==@"Blue")
    {
        NSLog(@"Blue selected");
        int gearIndex = self->_mainWindow->iSelectedGear;
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        int teeterTotterIndex = self->_mainWindow->iSelectedTotter;
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
        if (teeterTotterIndex > -1)
        {
            TeeterTotter *teeterTotter = [self->_mainWindow->currentLevel->teeterTotters objectAtIndex:teeterTotterIndex];
            [teeterTotter setColor:[NSColor blueColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if ([colorSelected isEqualToString:@"Purple"])
    {
        NSLog(@"Purple selected");
        int gearIndex = self->_mainWindow->iSelectedGear;
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        int teeterTotterIndex = self->_mainWindow->iSelectedTotter;
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
        if (teeterTotterIndex > -1)
        {
            TeeterTotter *teeterTotter = [self->_mainWindow->currentLevel->teeterTotters objectAtIndex:teeterTotterIndex];
            [teeterTotter setColor:[NSColor purpleColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if ([colorSelected isEqualToString:@"Red"])
    {
        NSLog(@"Red selected");
        int gearIndex = self->_mainWindow->iSelectedGear;
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        int teeterTotterIndex = self->_mainWindow->iSelectedTotter;
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
        if (teeterTotterIndex > -1)
        {
            TeeterTotter *teeterTotter = [self->_mainWindow->currentLevel->teeterTotters objectAtIndex:teeterTotterIndex];
            [teeterTotter setColor:[NSColor redColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if ([colorSelected isEqualToString:@"Green"])
    {
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        int teeterTotterIndex = self->_mainWindow->iSelectedTotter;
        if (flipperIndex > -1)
        {
            Flipper *flipper = [self->_mainWindow->currentLevel->flippers objectAtIndex:flipperIndex];
            [flipper setColor:[NSColor greenColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
        if (teeterTotterIndex > -1)
        {
            TeeterTotter *teeterTotter = [self->_mainWindow->currentLevel->teeterTotters objectAtIndex:teeterTotterIndex];
            [teeterTotter setColor:[NSColor greenColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
        
    }
    else if ([colorSelected isEqualToString:@"Magenta"])
    {
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        if (flipperIndex > -1)
        {
            Flipper *flipper = [self->_mainWindow->currentLevel->flippers objectAtIndex:flipperIndex];
            [flipper setColor:[NSColor magentaColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
    else if ([colorSelected isEqualToString:@"Yellow"])
    {
        int flipperIndex = self->_mainWindow->iSelectedFlipper;
        int teeterTotterIndex = self->_mainWindow->iSelectedTotter;
        if (flipperIndex > -1)
        {
            Flipper *flipper = [self->_mainWindow->currentLevel->flippers objectAtIndex:flipperIndex];
            [flipper setColor:[NSColor yellowColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
        if (teeterTotterIndex > -1)
        {
            TeeterTotter *teeterTotter = [self->_mainWindow->currentLevel->teeterTotters objectAtIndex:teeterTotterIndex];
            [teeterTotter setColor:[NSColor yellowColor]];
            [self->_mainWindow setNeedsDisplay:true];
        }
    }
}

- (IBAction)selectText:(id)sender {
    NSInteger *colorIndex = [self indexOfSelectedItem];
    printf(@"picked %d", colorIndex);
}

@end
