//
//  AppDelegate.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-06.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize mainWindow;
- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)save:(id)sender
{
    printf("saving");
    long result;



    NSSavePanel *sPanel = [NSSavePanel savePanel];

    result = [sPanel runModal];

    
    if ( result == NSOKButton) {
        NSURL *furl = [NSURL fileURLWithPath:[sPanel filename]];
                    NSString *aFile = [sPanel filename];
            const char *szfile = [aFile UTF8String];
            printf("filename: %s\n",szfile);
        MyDocument *myDoc = [[MyDocument alloc] init];
        for (int i=0; i < mainWindow->gears.count; i++)
        {
            Gear *g =(Gear*) [mainWindow->gears objectAtIndex:i];
            [myDoc addGear:[g getX] andY:[g getY]];
        }
        NSError *err = nil;
        [myDoc writeToURL:furl ofType:@"xml" error:&err];

    }

}




@end
