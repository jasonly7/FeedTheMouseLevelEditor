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
    int iSelectedGear;
    int iSelectedDrum;
    int iSelectedTotter;
    int iSelectedFlipper;
    bool isMouseSelected;
    CGPoint pt;
    CustomScrollView *scroller;
    NSComboBox *cboLevel;
    NSTextField *lblCoordinates;
    NSMutableArray *levels;
    Level *currentLevel;
    int curIndex;
    NSTrackingArea *trackingArea;
    Mouse *mouse;
    @public
        //NSMutableArray *gears;
    

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
