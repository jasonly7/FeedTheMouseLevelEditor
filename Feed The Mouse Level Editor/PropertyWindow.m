//
//  PropertyWindow.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2020-07-12.
//  Copyright © 2020 Jason Ly. All rights reserved.
//

#import "PropertyWindow.h"

@implementation PropertyWindow
- (BOOL)acceptsFirstResponder
{
    int gearIndex = 0;
    int flipperIndex = 0;
    
    [self->_colorComboBox removeAllItems];
    if (self->_mainWindow!=nil)
    {
        if (self->_mainWindow->iSelectedGear!=nil)
            gearIndex =  self->_mainWindow->iSelectedGear;
        if (self->_mainWindow->iSelectedFlipper!=nil)
            flipperIndex = self->_mainWindow->iSelectedFlipper;
        if (gearIndex > -1)
        {
            [self->_colorComboBox addItemWithObjectValue:@"Blue"];
            [self->_colorComboBox addItemWithObjectValue:@"Orange"];
            [self->_colorComboBox addItemWithObjectValue:@"Purple"];
            [self->_colorComboBox addItemWithObjectValue:@"Red"];
        }
        else if (flipperIndex > -1)
        {
            [self->_colorComboBox addItemWithObjectValue:@"Green"];
            [self->_colorComboBox addItemWithObjectValue:@"Magenta"];
            [self->_colorComboBox addItemWithObjectValue:@"Yellow"];
        }
    }
    
    return YES;
}
@end
