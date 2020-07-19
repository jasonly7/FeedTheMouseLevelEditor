//
//  MainWindow.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-12.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#import "Gear.h"
#import "Drum.h"
#import "TeeterTotter.h"
#import "Flipper.h"
#import "Coin.h"
#import "CustomScrollView.h"
#import "Level.h"
#import "MyDocument.h"
@interface MainWindow : NSView
{
    NSImage *image;
    float opacity;
   // NSBezierPath *path;
    int iSelectedCoin;
    
    int iSelectedDrum;
    
    bool isMouseSelected;
    CGPoint pt;
    NSPoint mousePt;
    CustomScrollView *scroller;
    NSComboBox *cboLevel;
    NSTextField *lblCoordinates;
    NSMutableArray *levels;
    
    int curIndex;
    NSTrackingArea *trackingArea;
    Mouse *mouse;
    @public
        Level *currentLevel;
        int iSelectedGear;
        int iSelectedFlipper;
        int iSelectedTotter;
}

//- (IBAction)addLevel:(id)sender;
- (IBAction)cboLevelSelected:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)open:(id)sender;
- (IBAction)New:(id)sender;
- (IBAction)pickColor:(id)sender;
- (NSPoint)randomPoint;
- (void) addGear;
- (void) addDrum;
- (void) addTeeterTotter;
- (void) addFlipper;
- (void) addCoin;
- (void) drawCoin;
- (void) drawGear;
- (void) drawDrum;
- (void) drawTeeterTotter;
- (void) drawFlipper;
- (void) addLevel;
+ (NSImage *)rotate:(NSImage *)image byAngle:(int)degrees;
@property (assign) float opacity;
@property (strong) NSImage *image;
@property (nonatomic, retain) IBOutlet CustomScrollView *scroller;
@property (nonatomic, retain) IBOutlet NSComboBox *cboLevel;
@property (nonatomic, retain) IBOutlet NSTextField *lblCoordinates;
@end
