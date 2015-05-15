/*
 --  OpenPlex 0.4.2
 --
 --  Originally Designed by CyberGhost84 on 5/02/14.
 --  Originally Coded by Wahlman.j on 5/02/14.
 --  Copyright (©) 2015 Wahlman.j, CyberGhost84 & Flipman6 All rights reserved.
 */

#import "ApplicationDelegate.h"
#import "NoMenu.h"

@interface NoMenu ()
@property (assign) IBOutlet NSWindow *window;
@end
@implementation NoMenu{
    NSString *returnString;
}
@synthesize darkModeOn,dark;
@synthesize guideIP,guideURL,updateButton,statusImage;
@synthesize loginButtonOutlet,myplexButtonOutlet,settingsButtonOutlet,trailersButtonOutlet,updateButtonOutlet;

-(id)init{
    
    self=[super initWithWindowNibName:@"NoMenu"];
    if(self)
    {
        //perform any initializations
    }
    return self;
}

- (void)refreshDarkMode {
    
    NSString * value = (__bridge NSString *)(CFPreferencesCopyValue((CFStringRef)@"AppleInterfaceStyle", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost));
    if ([value isEqualToString:@"Dark"]) {
        darkModeOn = YES;
    }
    else {
        darkModeOn = NO;
    }
    if (darkModeOn==YES) {
        dark.title=@"On";
    } else {
        dark.title=@"Off";
    }
}

- (IBAction)dark:(id)sender{
    [self refreshDarkMode];
    darkModeOn = !darkModeOn;
    
    //Change pref
    if (darkModeOn) {
        CFPreferencesSetValue((CFStringRef)@"AppleInterfaceStyle", @"Dark", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    }
    else {
        CFPreferencesSetValue((CFStringRef)@"AppleInterfaceStyle", NULL, kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    }
    
    //update listeners
    dispatch_async(dispatch_get_main_queue(), ^{
        CFNotificationCenterPostNotification(CFNotificationCenterGetDistributedCenter(), (CFStringRef)@"AppleInterfaceThemeChangedNotification", NULL, NULL, YES);
    });
    [self refreshDarkMode];
}

-(id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
    }
    return self;
}

-(void)windowWillLoad{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkForUpdate) name:@"updateAvailable" object:nil];
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [self refreshDarkMode];

    NSDictionary *version = [NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    NSString *productVersion = [version objectForKey:@"ProductVersion"];
    NSString *shortProductVersion = [productVersion substringWithRange:NSMakeRange(3, [productVersion length]-3)];
    //    NSLog (@"productVersion =========== %@", productVersion);
    float versionNumber = [shortProductVersion floatValue];
    if (versionNumber >= 10) {
        dark.enabled=YES;
    }else{
        dark.enabled=NO;
    }
    
    if (darkModeOn==YES) {
        dark.title=@"On";
    } else {
        dark.title=@"Off";
    }
    
    [self checkForUpdate];
    [self setButtonStatus];
    
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(checkServerStatus) userInfo:nil repeats:YES];

    NSString *guidelocalIP=[[NSString alloc] initWithFormat:@"Local IP :  %@",[self getLocalIPAddress]];
    NSString *guidecertString=[[NSString alloc] initWithFormat:@"Cert URL :  %@/trailers.cer",[self getLocalIPAddress]];
    
    [guideIP setTitleWithMnemonic:guidelocalIP];
    [guideIP setFont:[NSFont fontWithName:@"Helvetica Neue" size:14]];
    [guideURL setTitleWithMnemonic:guidecertString];
    [guideURL setFont:[NSFont fontWithName:@"Helvetica Neue" size:14]];
}

-(void)setButtonStatus{
    if (loginStatus==YES) {loginButtonOutlet.title=@"On";} else {loginButtonOutlet.title=@"Off";}
    if (myplexStatus==YES) {myplexButtonOutlet.title=@"On";} else {myplexButtonOutlet.title=@"Off";}
    if (settingsStatus==YES) {settingsButtonOutlet.title=@"On";} else {settingsButtonOutlet.title=@"Off";}
    if (trailersStatus==YES) {trailersButtonOutlet.title=@"On";} else {trailersButtonOutlet.title=@"Off";}
    if (updateStatus==YES) {updateButtonOutlet.title=@"On";} else {updateButtonOutlet.title=@"Off";}
}

-(void) checkForUpdate{

    if (updateAvailable==NO) {
        updateButton.enabled=NO;
        updateButton.title=@"No Updates";
    } else {
        updateButton.enabled=YES;
        updateButton.title=@"Update App";
    }
}

/*

-(void) checkServerStatus{
    NSDictionary* errorDict;
    NSAppleEventDescriptor *returnDescriptor = NULL;
    NSMutableString *scriptText = [NSMutableString stringWithString:@"set z to missing value\n"];
    [scriptText appendString:@"try\n"];
    [scriptText appendString:@"POSIX file \"/Applications/PlexConnect/PlexConnect.log\" as alias\n"];
    [scriptText appendString:@"on error\n"];
    [scriptText appendString:@"set z to \"No PlexConnect.Log Detected\"\n"];
    [scriptText appendString:@"end try\n"];
    [scriptText appendString:@"try\n"];
    [scriptText appendString:@"set z to do shell script \"/usr/bin/grep -ic 'Shutting' /Applications/PlexConnect/PlexConnect.log\"\n"];
    [scriptText appendString:@"end try\n"];
    [scriptText appendString:@"if z > 0 then\n"];
    [scriptText appendString:@"set z to \"PlexConnect is Not Running\"\n"];
    [scriptText appendString:@"else\n"];
    [scriptText appendString:@"set z to \"PlexConnect is Running\"\n"];
    [scriptText appendString:@"end if\n"];
    NSAppleScript* scriptObject = [[NSAppleScript alloc] initWithSource: scriptText];
    returnDescriptor = [scriptObject executeAndReturnError: &errorDict];
    NSString *returnString = [returnDescriptor stringValue];
    
    if ([returnString isEqual:@"PlexConnect is Running"]) {
        [statusImage setImage:[NSImage imageNamed:@"statusGreen"]];
    } else {
        [statusImage setImage:[NSImage imageNamed:@"statusRed"]];
    }
}

*/
 
- (NSString *)getLocalIPAddress
{
    NSArray *ipAddresses = [[NSHost currentHost] addresses];
    NSArray *sortedIPAddresses = [ipAddresses sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.allowsFloats = NO;
    
    for (NSString *potentialIPAddress in sortedIPAddresses)
    {
        if ([potentialIPAddress isEqualToString:@"127.0.0.1"]) {
            continue;
        }
        
        NSArray *ipParts = [potentialIPAddress componentsSeparatedByString:@"."];
        
        BOOL isMatch = YES;
        
        for (NSString *ipPart in ipParts) {
            if (![numberFormatter numberFromString:ipPart]) {
                isMatch = NO;
                break;
            }
        }
        if (isMatch) {
            return potentialIPAddress;
        }
    }
    
    // No IP found
    return @"?.?.?.?";
}

-(void)checkOnOffStates{
    NSURL *path = [NSURL URLWithString:@"/Applications/plexconnect_Backup"];
    NSDirectoryEnumerator *directoryEnumerator = [[NSFileManager defaultManager] enumeratorAtURL:path includingPropertiesForKeys:@[] options:NSDirectoryEnumerationSkipsHiddenFiles|NSDirectoryEnumerationSkipsPackageDescendants|NSDirectoryEnumerationSkipsSubdirectoryDescendants errorHandler:nil];
    loginStatus=NO;trailersStatus=NO;settingsStatus=NO,updateStatus=NO;myplexStatus=NO;
    for (NSString *path in directoryEnumerator) {
        
        NSString *path2 =[NSString stringWithFormat:@"%@",path];
        
        if ([path2 rangeOfString:@"login.auto"].location != NSNotFound) {loginStatus=YES;}
        if ([path2 rangeOfString:@"trailers.auto"].location != NSNotFound) {trailersStatus=YES;}
        if ([path2 rangeOfString:@"settings.auto"].location != NSNotFound) {settingsStatus=YES;}
        if ([path2 rangeOfString:@"update.auto"].location != NSNotFound) {updateStatus=YES;}
        if ([path2 rangeOfString:@"myplex.auto"].location != NSNotFound) {myplexStatus=YES;}
    }
}

- (IBAction)loginButtonAction:(id)sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"loginStatus" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    
    [self checkOnOffStates];
    [self setButtonStatus];
}
- (IBAction)updateButtonAction:(id)sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"updateStatus" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    
    [self checkOnOffStates];
    [self setButtonStatus];
}
- (IBAction)trailersButtonAction:(id)sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"trailersStatus" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    
    [self checkOnOffStates];
    [self setButtonStatus];
}
- (IBAction)myplexButtonAction:(id)sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"myplexStatus" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    
    [self checkOnOffStates];
    [self setButtonStatus];
}
- (IBAction)settingButtonAction:(id)sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"settingsStatus" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    
    [self checkOnOffStates];
    [self setButtonStatus];
}
- (IBAction)ClickedInstall:(id)sender {
    NSString* path1 = [[NSBundle mainBundle] pathForResource:@"Part1" ofType:@"scpt"];
    NSURL* url1 = [NSURL fileURLWithPath:path1];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript1 = [[NSAppleScript alloc] initWithContentsOfURL:url1 error:&errors];
    [appleScript1 executeAndReturnError:nil];

    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(setProgressLabel) userInfo:nil repeats:YES];

/*    NSString* path2 = [[NSBundle mainBundle] pathForResource:@"ProgressLabel" ofType:@"scpt"];
    NSURL* url2 = [NSURL fileURLWithPath:path2];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript2 = [[NSAppleScript alloc] initWithContentsOfURL:url2 error:&errors];
//    [appleScript2 executeAndReturnError:nil];

    
    NSDictionary* errorDict;
    NSAppleEventDescriptor *returnDescriptor = NULL;

    returnDescriptor = [appleScript2 executeAndReturnError: &errorDict];
    returnString = [returnDescriptor stringValue];
    
    
    NSLog(@"returnString:%@",returnString);
*/
/* --breaking path to 3rd applescript--
    
[self setProgressLabel];
 
*/
    
    
//    if ([returnString isEqual:@"PlexConnect is Running"]) {
//        [statusImage setImage:[NSImage imageNamed:@"statusGreen"]];
//    } else {
//        [statusImage setImage:[NSImage imageNamed:@"statusRed"]];
//    }
//    NSString *guidelocalIP=[[NSString alloc] initWithFormat:@"Local IP :  %@",[self getLocalIPAddress]];
    

//    [guideIP setTitleWithMnemonic:returnString];
//    [guideIP setTitleWithMnemonic:guidelocalIP];
//    [guideIP setFont:[NSFont fontWithName:@"Helvetica Neue" size:14]];
/*
    NSString* path3 = [[NSBundle mainBundle] pathForResource:@"Part3" ofType:@"scpt"];
    NSURL* url3 = [NSURL fileURLWithPath:path3];
    NSAppleScript* appleScript3 = [[NSAppleScript alloc] initWithContentsOfURL:url3 error:&errors];
    [appleScript3 executeAndReturnError:nil];
 */
    
}

-(void)setProgressLabel{
    [guideIP setStringValue:[self progressLabelString]];
}

- (NSString *)progressLabelString
{
    NSString* path2 = [[NSBundle mainBundle] pathForResource:@"ProgressLabel" ofType:@"scpt"];
    NSURL* url2 = [NSURL fileURLWithPath:path2];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript2 = [[NSAppleScript alloc] initWithContentsOfURL:url2 error:&errors];
    //    [appleScript2 executeAndReturnError:nil];
    
    
    NSDictionary* errorDict;
    NSAppleEventDescriptor *returnDescriptor = NULL;
    
    returnDescriptor = [appleScript2 executeAndReturnError: &errorDict];
    returnString = [returnDescriptor stringValue];
    
    NSLog(@"returnString:%@",returnString);
    
    return returnString;
}
@end