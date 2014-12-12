--
--  AppDelegate.applescript
--  OpenPlex-installer
--
--
--  Originally designed by iCyberGhost on 5/02/14.
--  Originally coded by Wahlman.j on 5/02/14.
--  Copyright (c) 2014 CyberGhost & Wahlman.j. All rights reserved.
--  myProgressBar's incrementBy_(20)

script AppDelegate
    property parent : class "NSObject"
    
    on buttonhandlerinstall_(sender)
        display dialog "Installing OpenPlex..." with title "OpenPlex Status"
        delay 2
        do shell script ""
        do shell script "killall OpenPlex-installer"
    end buttonhandlerinstall_
    
    on buttonhandlerinstall10_(sender)
        display notification "Installing OpenPlex..." with title "OpenPlex Status"
        delay 2
        do shell script ""
        do shell script "killall OpenPlex-installer"
    end buttonhandlerinstall10_
	
	-- IBOutlets
	property theWindow : missing value
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script