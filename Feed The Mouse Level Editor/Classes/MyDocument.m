//
//  MyDocument.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-26.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import "MyDocument.h"

@implementation MyDocument

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        root = (NSXMLElement *)[NSXMLNode elementWithName:@"FeedTheMouse"];
        xmlDoc = [[NSXMLDocument alloc] initWithRootElement:root];
        [xmlDoc setVersion:@"1.0"];
        [xmlDoc setCharacterEncoding:@"UTF-8"];
        
        //[root addChild:[NSXMLNode commentWithStringValue:@"Hello world!"]];
       // NSXMLNode *gearNode = [[NSXMLNode alloc] initWithKind: NSXMLElementKind];
        //gearNode.name = @"Gear";
       // NSXMLElement *gearElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Gear"];
        //[root addChild:gearElement];

    }
    return self;
}

- (void) addGear: (int) x andY: (int)y
{
    NSXMLElement *gearElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Gear"];
    NSString *strX = [NSString stringWithFormat:@"%d", x];
    NSXMLElement *xElement = (NSXMLElement*)[NSXMLNode elementWithName:@"X"];
    [xElement initWithName:@"X" stringValue:strX];
    //[xElement setValue:strX];
    NSString *strY = [NSString stringWithFormat:@"%d", y];
    NSXMLElement *yElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Y"];
    [yElement initWithName:@"Y" stringValue:strY];
   // [yElement setValue:strY];
    [gearElement addChild:xElement];
    [gearElement addChild:yElement];
    [root addChild:gearElement];
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    return YES;
}

- (BOOL)writeToFile:(NSString *)fileName ofType:(NSString *)type {
    
    NSData *xmlData = [xmlDoc XMLDataWithOptions:NSXMLNodePrettyPrint];
    if (![xmlData writeToFile:fileName atomically:YES]) {
        NSBeep();
        NSLog(@"Could not write document out...");
        return NO;
    }
    return YES;
}

-(BOOL)writeToURL:(NSURL *)url ofType:(NSString *)typeName error:(NSError **)outError
{
    NSData *xmlData = [xmlDoc XMLDataWithOptions:NSXMLNodePrettyPrint];
    if (![xmlData writeToURL:url atomically:YES]) {
        NSBeep();
        NSLog(@"Could not write document out...");
        return NO;
    }
    return YES;
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

@end
