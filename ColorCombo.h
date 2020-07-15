//
//  ColorCombo.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2020-07-11.
//  Copyright © 2020 Jason Ly. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainWindow.h"
NS_ASSUME_NONNULL_BEGIN

@interface ColorCombo : NSComboBox
{
    NSString *colorSelected;
}

- (IBAction)pickColor:(id)sender;
- (id) initWithCoder:(NSCoder *)coder;
- (IBAction)selectText:(id)sender;

@property (assign) IBOutlet MainWindow *mainWindow;
@end

NS_ASSUME_NONNULL_END
