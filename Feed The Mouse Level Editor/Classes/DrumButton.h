//
//  DrumButton.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-04-20.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainWindow.h"
@interface DrumButton : NSButtonCell
{
    MainWindow *mainWindow;
}
- (IBAction)addDrum:(id)sender;

@property (nonatomic, retain) IBOutlet MainWindow *mainWin;
@end
