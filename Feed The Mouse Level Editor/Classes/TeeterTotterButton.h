//
//  TeeterTotterButton.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2014-03-06.
//  Copyright (c) 2014 Jason Ly. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainWindow.h"

@interface TeeterTotterButton : NSButtonCell
{
    MainWindow *mainWindow;
}
- (IBAction)addTeeterTotter:(id)sender;

@property (nonatomic, retain) IBOutlet MainWindow *mainWin;
@end
