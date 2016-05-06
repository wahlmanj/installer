/*
 --  OpenPlex-installer
 --
 --  Originally Designed by CyberGhost84 on 5/02/14.
 --  Originally Coded by Wahlman.j on 5/02/14.
 --  Copyright (©) 2015 Wahlman.j, CyberGhost84 & Flipman6 All rights reserved.
 */

#import <Cocoa/Cocoa.h>

@interface NoMenu : NSWindowController <NSApplicationDelegate>
@property (strong) IBOutlet NSTextField *guideIP;
- (IBAction)ClickedInstall:(id)sender;
@property(nonatomic, retain) NSTimer *yourTimer;

@end