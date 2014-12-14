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
    
    property installProgressBar : missing value
    
    on buttonhandlerinstall_(sender)
        tell installProgressBar to startAnimation:me -- another way
        set animated to true
        try
            do shell script "killall OpenPlex.app"
            onerror
            end try
        display dialog "Installing OpenPlex..." with title "OpenPlex Status"
        delay 2
        do shell script "cd /Applications; curl -L https://github.com/wahlmanj/OpenPlex/raw/master/10.7/OpenPlex.zip > OpenPlex.zip; ditto -xk OpenPlex.zip /Applications; rm OpenPlex.zip; open OpenPlex.app"
        do shell script "killall OpenPlex-installer"
        tell installProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerinstall_
    
    on buttonhandlerinstall10_(sender)
        tell installProgressBar to startAnimation:me -- another way
        set animated to true
        try
            do shell script "killall OpenPlex.app"
            onerror
        end try
        display notification "Installing OpenPlex..." with title "OpenPlex Status"
        delay 2
        do shell script "cd /Applications; curl -L https://github.com/wahlmanj/OpenPlex/raw/master/10.6/OpenPlex.zip > OpenPlex.zip; ditto -xk OpenPlex.zip /Applications; rm OpenPlex.zip; open OpenPlex.app"
        do shell script "killall OpenPlex-installer"
        tell installProgressBar to stopAnimation:me -- another way
        set animated to false
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