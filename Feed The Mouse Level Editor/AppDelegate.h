//
//  AppDelegate.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-06.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MyDocument.h"
@interface AppDelegate : NSObject <NSApplicationDelegate>
- (NSXMLDocument*)createXMLDocumentFromFile:(NSString *)file;
- (IBAction)save:(id)sender;
@property (assign) IBOutlet NSWindow *window;

@end
