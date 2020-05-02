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

- (void) addLevel: (Level*) lvl
{
    NSXMLElement *levelElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Level"];
//    NSString *strLevelNumber = [NSString stringWithFormat:@"%d", lvl->num];
    Mouse *mouse = lvl->mouse;
    int x = [mouse getX];
    int y = [mouse getY];
    NSXMLElement *mouseElement = [self createMouse:x andY:y];
    [levelElement addChild:mouseElement];
    for (int i = 0; i < lvl->coins.count; i++)
    {
        Coin *c = lvl->coins[i];
        int x = [c getX];
        int y = [c getY];
        NSXMLElement *coinElement = [self createCoin:(x) andY:(y)];
        [levelElement addChild:coinElement];
    }

    for (int i = 0; i < lvl->gears.count; i++)
    {
        Gear *g = lvl->gears[i];
        int x = [g getX];
        int y = [g getY];
        NSString *color = [g getStringColor];
        NSXMLElement *gearElement = [self createGear:(x) andY:(y) andColor:color];
        [levelElement addChild:gearElement];
    }
    for (int i = 0; i < lvl->drums.count; i++)
    {
        Drum *d = lvl->drums[i];
        int x = [d getX];
        int y = [d getY];
        float ang = [d getAngle];
        NSXMLElement *drumElement = [self createDrum:x andY:y andAngle:ang];
        [levelElement addChild:drumElement];
    }
    for (int i = 0; i < lvl->flippers.count; i++)
    {
        Flipper *f = lvl->flippers[i];
        int x = [f getX];
        int y = [f getY];
        float ang = [f getAngle];
        NSString *color = [f getStringColor];
        NSXMLElement *flipperElement = [self createFlipper:x andY:y andAngle:ang andIsFlipped:f->isImgFlipped andColor:color];
        [levelElement addChild:flipperElement];
    }
    for (int i = 0; i < lvl->teeterTotters.count; i++)
    {
        TeeterTotter *t = lvl->teeterTotters[i];
        int x = [t getX];
        int y = [t getY];
        NSString *color = [t getStringColor];
        NSXMLElement *totterElement = [self createTeeterTotter:x andY:y andColor:color];
        [levelElement addChild:totterElement];
    }
    [root addChild:levelElement];

}

- (NSXMLElement*) createTeeterTotter: (int) x andY: (int)y andColor:(NSString *)color
{
    NSXMLElement *totterElement = (NSXMLElement*)[NSXMLNode elementWithName:@"TeeterTotter"];
    
    NSString *strX = [NSString stringWithFormat:@"%d", x];
    NSXMLElement *xElement = (NSXMLElement*)[NSXMLNode elementWithName:@"X"];
    [xElement initWithName:@"X" stringValue:strX];
    
    NSString *strY = [NSString stringWithFormat:@"%d", y];
    NSXMLElement *yElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Y"];
    [yElement initWithName:@"Y" stringValue:strY];
    
    NSXMLElement *colorElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Color"];
    [colorElement initWithName:@"Color" stringValue:color];
    
    [totterElement addChild:xElement];
    [totterElement addChild:yElement];
    [totterElement addChild:colorElement];
    return totterElement;
}

- (NSXMLElement*) createMouse: (int) x andY: (int)y
{
    NSXMLElement *mouseElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Mouse"];
    
    NSString *strX = [NSString stringWithFormat:@"%d", x];
    NSXMLElement *xElement = (NSXMLElement*)[NSXMLNode elementWithName:@"X"];
    [xElement initWithName:@"X" stringValue:strX];
    
    NSString *strY = [NSString stringWithFormat:@"%d", y];
    NSXMLElement *yElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Y"];
    [yElement initWithName:@"Y" stringValue:strY];

    [mouseElement addChild:xElement];
    [mouseElement addChild:yElement];

    return mouseElement;
}

- (NSXMLElement*) createCoin: (int) x andY: (int)y
{
    NSXMLElement *coinElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Coin"];
    
    NSString *strX = [NSString stringWithFormat:@"%d", x];
    NSXMLElement *xElement = (NSXMLElement*)[NSXMLNode elementWithName:@"X"];
    [xElement initWithName:@"X" stringValue:strX];
    
    NSString *strY = [NSString stringWithFormat:@"%d", y];
    NSXMLElement *yElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Y"];
    [yElement initWithName:@"Y" stringValue:strY];
    
    [coinElement addChild:xElement];
    [coinElement addChild:yElement];
    return coinElement;
}

- (NSXMLElement*) createGear: (int) x andY: (int)y andColor:(NSString *)color
{
    NSXMLElement *gearElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Gear"];
    
    NSString *strX = [NSString stringWithFormat:@"%d", x];
    NSXMLElement *xElement = (NSXMLElement*)[NSXMLNode elementWithName:@"X"];
    [xElement initWithName:@"X" stringValue:strX];

    NSString *strY = [NSString stringWithFormat:@"%d", y];
    NSXMLElement *yElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Y"];
    [yElement initWithName:@"Y" stringValue:strY];
    
    NSXMLElement *colorElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Color"];
    [colorElement initWithName:@"Color" stringValue:color];

    [gearElement addChild:xElement];
    [gearElement addChild:yElement];
    [gearElement addChild:colorElement];
    return gearElement;
}

- (NSXMLElement*) createDrum: (int) x andY: (int)y andAngle:(float)a 
{
    NSXMLElement *drumElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Drum"];
    NSString *strX = [NSString stringWithFormat:@"%d", x];
    NSXMLElement *xElement = (NSXMLElement*)[NSXMLNode elementWithName:@"X"];
    [xElement initWithName:@"X" stringValue:strX];
    
    NSString *strY = [NSString stringWithFormat:@"%d", y];
    NSXMLElement *yElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Y"];
    [yElement initWithName:@"Y" stringValue:strY];

    NSString *strAngle = [NSString stringWithFormat:@"%f", a];
    NSXMLElement *angleElement = (NSXMLElement*)[NSXMLNode elementWithName:@"ANGLE"];
    [angleElement initWithName:@"ANGLE" stringValue:strAngle];

    [drumElement addChild:xElement];
    [drumElement addChild:yElement];
    [drumElement addChild:angleElement];

    return drumElement;
}

- (NSXMLElement*) createFlipper: (int) x andY: (int)y andAngle:(float)a andIsFlipped:(bool)isFlipped andColor:(NSString *)color
{
    NSXMLElement *flipperElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Flipper"];
    NSString *strX = [NSString stringWithFormat:@"%d", x];
    NSXMLElement *xElement = (NSXMLElement*)[NSXMLNode elementWithName:@"X"];
    [xElement initWithName:@"X" stringValue:strX];
    
    NSString *strY = [NSString stringWithFormat:@"%d", y];
    NSXMLElement *yElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Y"];
    [yElement initWithName:@"Y" stringValue:strY];
    
    NSString *strAngle = [NSString stringWithFormat:@"%f", a];
    NSXMLElement *angleElement = (NSXMLElement*)[NSXMLNode elementWithName:@"ANGLE"];
    [angleElement initWithName:@"ANGLE" stringValue:strAngle];
    
    NSString *strFlipped;
    if (isFlipped)
        strFlipped = @"true";
    else
        strFlipped = @"false";
    NSXMLElement *isFlippedElement = (NSXMLElement*)[NSXMLNode elementWithName:@"ISFLIPPED"];
    [isFlippedElement initWithName:@"ISFLIPPED" stringValue:strFlipped];
    
    NSXMLElement *colorElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Color"];
    [colorElement initWithName:@"Color" stringValue:color];
    
    [flipperElement addChild:xElement];
    [flipperElement addChild:yElement];
    [flipperElement addChild:angleElement];
    [flipperElement addChild:isFlippedElement];
    [flipperElement addChild:colorElement];
    return flipperElement;
}
/*- (void) addDrum: (int) x andY: (int)y andAngle:(float)a
{
    NSXMLElement *drumElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Drum"];
    NSString *strX = [NSString stringWithFormat:@"%d", x];
    NSXMLElement *xElement = (NSXMLElement*)[NSXMLNode elementWithName:@"X"];
    [xElement initWithName:@"X" stringValue:strX];
    //[xElement setValue:strX];
    NSString *strY = [NSString stringWithFormat:@"%d", y];
    NSXMLElement *yElement = (NSXMLElement*)[NSXMLNode elementWithName:@"Y"];
    [yElement initWithName:@"Y" stringValue:strY];
    
    NSString *strAngle = [NSString stringWithFormat:@"%f", a];
    NSXMLElement *angleElement = (NSXMLElement*)[NSXMLNode elementWithName:@"ANGLE"];
    [angleElement initWithName:@"ANGLE" stringValue:strAngle];

    [drumElement addChild:xElement];
    [drumElement addChild:yElement];
    [drumElement addChild:angleElement];
    [root addChild:drumElement];
}*/

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
    // create and init NSXMLParser object
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:data];
    
    // create and init our delegate
    parser = [[XMLParser alloc] initXMLParser];
    
    // set delegate
    [nsXmlParser setDelegate:parser];
    
    // parsing...
    BOOL success = [nsXmlParser parse];
    
    // test the result
    if (success) {
        
    }
    
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
