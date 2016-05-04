/*
 --  OpenPlex 0.4.2
 --
 --  Originally Designed by CyberGhost84 on 5/02/14.
 --  Originally Coded by Wahlman.j on 5/02/14.
 --  Copyright (©) 2015 Wahlman.j, CyberGhost84 & Flipman6 All rights reserved.
 */

#import "NoMenu.h"

@interface NoMenu ()
@end
@implementation NoMenu{
    NSString *returnString;
}
@synthesize guideIP,guideURL;
@synthesize yourTimer;
@synthesize clickedInstall_outlet;

- (IBAction)ClickedInstall:(id)sender {
    [guideIP setStringValue:@"Installing CLT or Python and git \nThis can take some time, so please be patient..."];

    NSString* path1 = [[NSBundle mainBundle] pathForResource:@"Part1" ofType:@"scpt"];
    NSURL* url1 = [NSURL fileURLWithPath:path1];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript1 = [[NSAppleScript alloc] initWithContentsOfURL:url1 error:&errors];
    [appleScript1 executeAndReturnError:NULL];
    
    clickedInstall_outlet.enabled=NO;
    
    yourTimer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(setProgressLabel) userInfo:NULL repeats:YES];
}

-(void)setProgressLabel{
    [guideIP setStringValue:[self progressLabelString]];
    if ([[self progressLabelString] isEqualToString: @"Cloning OpenPlex Complete"]) {
        [yourTimer invalidate];
        [guideIP setStringValue:@"Installing OpenPlex into menubar\nThis should be relatively quick, but still be patient..."];
        NSString* path3 = [[NSBundle mainBundle] pathForResource:@"Part3" ofType:@"scpt"];
        NSURL* url3 = [NSURL fileURLWithPath:path3];NSDictionary* errors = [NSDictionary dictionary];
        NSAppleScript* appleScript3 = [[NSAppleScript alloc] initWithContentsOfURL:url3 error:&errors];
        [appleScript3 executeAndReturnError:NULL];
    }else{
    }
}

- (NSString *)progressLabelString
{
    NSString* path2 = [[NSBundle mainBundle] pathForResource:@"ProgressLabel" ofType:@"scpt"];
    NSURL* url2 = [NSURL fileURLWithPath:path2];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript2 = [[NSAppleScript alloc] initWithContentsOfURL:url2 error:&errors];
    [appleScript2 executeAndReturnError:NULL];
    
    
    NSDictionary* errorDict;
    NSAppleEventDescriptor *returnDescriptor = NULL;
    
    returnDescriptor = [appleScript2 executeAndReturnError: &errorDict];
    returnString = [returnDescriptor stringValue];
    
    return returnString;
}
@end