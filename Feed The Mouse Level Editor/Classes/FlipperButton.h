//
//  FlipperButton.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2014-04-26.
//  Copyright (c) 2014 Jason Ly. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainWindow.h"

@interface FlipperButton : NSButtonCell
{
    MainWindow *mainWindow;
}

-(IBAction)addFlipper:(id)sender;

@property (nonatomic, retain) IBOutlet MainWindow *mainWin;
@end
