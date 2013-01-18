//
//  GearButton.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-06.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainWindow.h"

@interface GearButton : NSButtonCell
{
    MainWindow *mainWin;
}
- (IBAction)addGear:(id)pId;

@property (nonatomic, retain) IBOutlet MainWindow *mainWin;
@end
