//
//  Gear.h
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2013-01-18.
//  Copyright (c) 2013 Jason Ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Circle.h"

@interface Gear : Circle
{

}

- (Gear*) initializeGearAt:(float) x and: (float) y;
- (int)getX;
- (int)getY;
@end
