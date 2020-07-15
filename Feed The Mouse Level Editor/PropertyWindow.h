//
//  PropertyWindow.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2020-07-12.
//  Copyright © 2020 Jason Ly. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ColorCombo.h"

NS_ASSUME_NONNULL_BEGIN

@interface PropertyWindow : NSView
{
    @public
   // ColorCombo *colorComboBox;
}

- (BOOL)acceptsFirstResponder;
@property (assign) IBOutlet MainWindow *mainWindow;
@property (assign) IBOutlet ColorCombo *colorComboBox;
@end

NS_ASSUME_NONNULL_END
