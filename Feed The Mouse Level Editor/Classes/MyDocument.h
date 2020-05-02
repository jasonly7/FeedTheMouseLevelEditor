//
//  MyDocument.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-26.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Level.h"
#import "XMLParser.h"

@interface MyDocument : NSDocument
{
    NSXMLDocument *xmlDoc;
    NSXMLElement *root;
@public
    XMLParser *parser;
}
- (NSXMLElement*) createCoin: (int) x andY: (int)y;
- (NSXMLElement*) createGear: (int) x andY: (int)y andColor: (NSString*) color;
- (NSXMLElement*) createDrum: (int) x andY: (int)y andAngle: (float)a;
- (NSXMLElement*) createFlipper: (int) x andY: (int)y andAngle: (float)a andIsFlipped: (bool)isFlipped andColor: (NSString*)color;
- (NSXMLElement*) createTeeterTotter: (int) x andY: (int)y andColor: (NSString*) color;
- (NSXMLElement*) createMouse: (int) x andY: (int)y;
- (void) addLevel: (Level*) lvl;
@end
