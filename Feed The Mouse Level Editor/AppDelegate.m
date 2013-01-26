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

   // NSArray *filetypes = [NSArray arrayWithObject:@"xml"];

    NSSavePanel *sPanel = [NSSavePanel savePanel];
 //   [sPanel setAllowsMultipleSelection:NO];
    result = [sPanel runModal];
   // result = [sPanel runModalForDirectory:@"./FeedTheMouse.xml" file:nil types:filetypes];

    if ( result == NSOKButton) {
        NSURL *furl = [NSURL fileURLWithPath:[sPanel filename]];
                    NSString *aFile = [sPanel filename];
            const char *szfile = [aFile UTF8String];
            printf("%s",szfile);
        MyDocument *myDoc = [[MyDocument alloc] init];
        NSError *err = nil;
        [myDoc writeToURL:furl ofType:@"xml" error:&err];
            //NSXMLDocument *xmlDoc = [self createXMLDocumentFromFile:aFile];
    }

}

//- (NSXMLDocument*)createXMLDocumentFromFile:(NSString *)file {
   /* NSXMLDocument *xmlDoc;
    NSError *err=nil;
        
    NSString *text = @"<FeedTheMouse></FeedTheMouse>";
    NSString *path = file;
    [text writeToFile:path atomically:YES encoding: NSUTF8StringEncoding error: err];
    
    NSURL *furl = [NSURL fileURLWithPath:file];
    if (!furl) {
        NSLog(@"Can't create an URL from file %@.", file);
        return nil;
    }

    if (xmlDoc == nil) {
        xmlDoc = [[NSXMLDocument alloc] initWithContentsOfURL:furl
                                                      options:NSXMLDocumentTidyXML
                                                        error:&err];
    }
    if (xmlDoc == nil)  {
        if (err) {
            printf ("@%s", file);
            [self handleError:err];
        }
        return nil;
    }
    
    if (err) {
        [self handleError:err];
    }*/
    
 //      return xmlDoc;
//}


@end
