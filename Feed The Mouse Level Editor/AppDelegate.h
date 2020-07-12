//
//  AppDelegate.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-06.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MyDocument.h"
#import "MainWindow.h"
@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    MainWindow *mainWindow;
}
//- (IBAction)save:(id)sender;
- (IBAction)addLevel:(id)sender;


@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet MainWindow *mainWindow;

@end
