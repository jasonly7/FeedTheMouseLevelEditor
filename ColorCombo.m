//
//  ColorCombo.m
//  Feed The Mouse Level Editor
//
//  Created by Jason Ly on 2020-07-11.
//  Copyright © 2020 Jason Ly. All rights reserved.
//

#import "ColorCombo.h"

@implementation ColorCombo

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (IBAction)pickColor:(id)sender
{
    printf("picked color");
   // NSInteger *colorIndex = [self indexOfSelectedItem];
    //if (!colorIndex)
       // printf(@"picked %d", colorIndex);

   
}
- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder: coder]) {
        [self removeAllItems];
        [self addItemWithObjectValue:@"Orange"];
        [self addItemWithObjectValue:@"Blue"];
    }
    return self;
}
- (IBAction)colorPick:(id)sender {
    //int colorIndex = self.indexOfSelectedItem;
    NSString *str = self.stringValue;
    NSLog(str );
}

- (IBAction)selectText:(id)sender {
    NSInteger *colorIndex = [self indexOfSelectedItem];
    printf(@"picked %d", colorIndex);
}

@end
