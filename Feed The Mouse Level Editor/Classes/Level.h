//
//  Level.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-03-24.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gear.h"
#import "Drum.h"
#import "TeeterTotter.h"
#import "Flipper.h"
#import "Coin.h"
#import "Mouse.h"

@interface Level : NSObject
{
    @public
    int num;
    NSMutableArray *gears;
    NSMutableArray *drums;
    NSMutableArray *teeterTotters;
    NSMutableArray *flippers;
    NSMutableArray *coins;
    Mouse *mouse;
}

-(void) initializeLevel:(int) num;
-(void) addGear:(Gear*) g;
-(void) addDrum:(Drum*) d;
-(void) addTeeterTotter:(TeeterTotter*) t;
-(void) addFlipper:(Flipper *)f;
-(void) addCoin:(Coin *)c;
-(void) setMouse:(Mouse *)m;
@end
