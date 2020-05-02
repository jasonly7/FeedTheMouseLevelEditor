//
//  CoinButton.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2015-01-21.
//  Copyright (c) 2015 Jason Ly. All rights reserved.
//

#import "CoinButton.h"

@implementation CoinButton
@synthesize mainWin;
- (IBAction)addCoin:(id)sender
{
    [mainWin addCoin];
}
@end

