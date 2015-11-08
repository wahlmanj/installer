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
    
    -- IBOutlets
    property theWindow : missing value
    
    on applicationWillFinishLaunching:aNotification
        -- Insert code here to initialize your application before any files are opened
        try
            do shell script "killall OpenPlex"
        end try
        tell me
            display dialog "Detecting OS X version and installing OpenPlex, this will take some time depending on your ISP..." buttons {"cancel", "OK"} default button "OK" with title "OpenPlex Status"
            if the button returned of the result is "caŒncel" then
                do shell script "killall OpenPlex-installer"
            end if
        end tell
        
        -- what OS version do I have
        set osver to system version of (system info)
        considering numeric strings
            set num_osver to osver
            
            -- if OS version is > 10.9
            if num_osver ³ 10.9 then
                
                tell application "Finder"
                    try
                        do shell script "rm -R /usr/local/git/OP" with administrator privileges
                    end try
                    try
                        do shell script "rm -R /usr/local/git/OpenPlex" with administrator privileges
                    end try
                    try
                        do shell script "rm -R ~/Library/Application\\ Support/OpenPlex" with administrator privileges
                    end try
                    try
                        do shell script "rm /Applications/clt.bash" with administrator privileges
                    end try
                    
                    --install clt (& git) if not installed for ³ 10.9
                    
                    do shell script "cd /Applications; curl -O https://raw.githubusercontent.com/wahlmanj/git/master/clt.bash; chmod +x clt.bash; ./clt.bash"
                    
                    --codesign the python.app so firewall doesn't complain if in use
                    
                    try
                        do shell script "codesign -f -s - /System/Library/Frameworks/Python.framework/Versions/2.7/Resources/Python.app" with administrator privileges
                    end try
                    
                end tell
                
                else
                
                -- if OS version is < 10.9
                
                do shell script "cd /Applications; curl -L https://github.com/wahlmanj/git/raw/master/python.zip > python.zip; ditto -xk python.zip /Applications; sudo installer -pkg /Applications/python-2.7.9-macosx10.6.pkg -target /; chmod 777 /Applications/python.zip; cd /Applications; rm python.zip; chmod 777 /Applications/python-2.7.9-macosx10.6.pkg; rm /Applications/python-2.7.9-macosx10.6.pkg" with administrator privileges
                tell application "Finder"
                    if (exists folder "System:Library:Frameworks:Python.framework:Versions:2.7" of the startup disk) then
                        do shell script "rm -R /System/Library/Frameworks/Python.framework/Versions/2.7" with administrator privileges
                    end if
                    try
                        do shell script "rm -R /usr/local/git/OP" with administrator privileges
                    end try
                    try
                        do shell script "rm -R /usr/local/git/OpenPlex" with administrator privileges
                    end try
                    try
                        do shell script "rm -R ~/Library/Application\\ Support/OpenPlex" with administrator privileges
                    end try
                    if (exists folder "Library:Frameworks:Python.framework:Versions:2.7" of the startup disk) then
                        try
                            do shell script "rm -R /System/Library/Frameworks/Python.framework/Versions/2.7" with administrator privileges
                        end try
                        do shell script "ln -s /Library/Frameworks/Python.framework/Versions/2.7 /System/Library/Frameworks/Python.framework/Versions/2.7" with administrator privileges
                    end if
                    if (exists folder "System:Library:Frameworks:Python.framework:Versions:2.7" of the startup disk) then
                        try
                            do shell script "chown -R root:wheel /System/Library/Frameworks/Python.framework/Versions/2.7" with administrator privileges
                        end try
                        try
                            do shell script "sudo rm /System/Library/Frameworks/Python.framework/Versions/Current" with administrator privileges
                        end try
                        try
                            do shell script "sudo ln -s /System/Library/Frameworks/Python.framework/Versions/2.7 /System/Library/Frameworks/Python.framework/Versions/Current" with administrator privileges
                        end try
                        try
                            do shell script "sudo rm /usr/bin/pydoc" with administrator privileges
                        end try
                        try
                            do shell script "sudo rm /usr/bin/python" with administrator privileges
                        end try
                        try
                            do shell script "sudo rm /usr/bin/pythonw" with administrator privileges
                        end try
                        try
                            do shell script "sudo rm /usr/bin/python-config" with administrator privileges
                        end try
                        try
                            do shell script "sudo ln -s /System/Library/Frameworks/Python.framework/Versions/2.7/bin/pydoc /usr/bin/pydoc" with administrator privileges
                        end try
                        try
                            do shell script "sudo ln -s /System/Library/Frameworks/Python.framework/Versions/2.7/bin/python /usr/bin/python" with administrator privileges
                        end try
                        try
                            do shell script "sudo ln -s /System/Library/Frameworks/Python.framework/Versions/2.7/bin/pythonw /usr/bin/pythonw" with administrator privileges
                        end try
                        try
                            do shell script "sudo ln -s /System/Library/Frameworks/Python.framework/Versions/2.7/bin/python-config /usr/bin/python-config" with administrator privileges
                        end try
                    end if
                    
                    do shell script "cd /Library/Frameworks/Python.framework/Versions/2.7/Resources; curl -L https://github.com/wahlmanj/git/raw/master/firewall.zip > firewall.zip; ditto -xk firewall.zip /Library/Frameworks/Python.framework/Versions/2.7/Resources; chmod 777 /Library/Frameworks/Python.framework/Versions/2.7/Resources/firewall.zip; cd /Library/Frameworks/Python.framework/Versions/2.7/Resources; rm firewall.zip" with administrator privileges
                    do shell script "cd /Applications; curl -L https://github.com/wahlmanj/git/raw/master/git.zip > git.zip; ditto -xk git.zip /Applications; hdiutil attach /Applications/git-2.2.1-intel-universal-snow-leopard.dmg; cp /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal/git-2.2.1-intel-universal-snow-leopard.pkg /Applications; sudo installer -pkg /Applications/git-2.2.1-intel-universal-snow-leopard.pkg -target /; hdiutil unmount /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal; chmod 777 /Applications/git.zip; cd /Applications; rm git.zip" with administrator privileges
                    do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
                    do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
                    do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
                    do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
                    set fileAsPOSIX to (POSIX path of "/etc/paths")
                    set theString to quoted form of "/usr/local/git/bin"
                    try
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is equal to "1" then
                        end if
                    end try
                    try
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        on error
                        do shell script "cd /etc; echo '/usr/local/git/bin' | cat - paths > temp && mv temp paths" with administrator privileges
                    end try
                    
                    --codesign the python.app so firewall doesn't complain if in use
                    
                    try
                        do shell script "codesign -f -s - /System/Library/Frameworks/Python.framework/Versions/2.7/Resources/Python.app" with administrator privileges
                    end try
                    
                    
                end tell
            end if
        end considering
        
        -- ----------------------------------
        -- OpenPlex Install and configuration
        -- ----------------------------------
        
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                try
                    do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash; trashbasebash.bash"
                end try
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                try
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                    do shell script "rm -R /Applications/PlexConnect"
                    onerror
                end try
            end if
            if (exists folder "Applications:PlexConnect" of the startup disk) then
                try
                    do shell script "chmod -R 777 /Applications/PlexConnect" with administrator privileges
                    do shell script "rm -R /Applications/PlexConnect" with administrator privileges
                end try
            end if
        end tell
        do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/iBaa/PlexConnect.git"
        try
            do shell script "rm -R ~/Library/Application\\ Support/OpenPlex" with administrator privileges
        end try
        try
            do shell script "cd ~/Library/Application\\ Support; rm statusOP" with administrator privileges
        end try
        do shell script "cd ~/Library/Application\\ Support; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone --progress https://github.com/wahlmanj/OpenPlex.git > ~/Library/Application\\ Support/statusOP 2>&1 &"
        -- Compressing
        set fileSize to 0
        set curTransferred to 0
        set curProgress to 0
        set one to 0
        set two to 0
        repeat until two = "objects"
            try
                set lastLine to paragraph -1 of (do shell script "cat ~/Library/Application\\ Support/statusOP")
                set one to word 1 of lastLine
                set two to word 2 of lastLine
                set curProgress to word 3 of lastLine
                set fileSize to word 5 of lastLine
                set curTransferred to word 4 of lastLine
                tell me
                    display dialog "Cloning OpenPlex...
                    
                    " & one & " " & two & " " & curTransferred & " / " & fileSize & " (" & curProgress & "%)" buttons {"Please Wait", "cancel"} default button "Please Wait" giving up after 2.5 with title "OpenPlex Status"
                    if the button returned of the result is "cancel" then return
                end tell
            end try
        end repeat
        set fileSize to 0
        set curTransferred to 0
        set curProgress to 0
        set one to 0
        set two to 0
        set speed to 0
        set mb to 0
        repeat until two = "deltas"
            try
                set lastLine to paragraph -1 of (do shell script "cat ~/Library/Application\\ Support/statusOP")
                set one to word 1 of lastLine
                set two to word 2 of lastLine
                set curProgress to word 3 of lastLine
                set fileSize to word 5 of lastLine
                set curTransferred to word 4 of lastLine
                set speed to word 9 of lastLine
                set mb to word 10 of lastLine
                -- objects
                tell me
                    display dialog "Cloning OpenPlex...
                    
                    " & one & " " & two & " " & curTransferred & " / " & fileSize & " (" & curProgress & "%)" & " " & speed & " " & mb & "/s" buttons {"Please Wait", "cancel"} default button "Please Wait" giving up after 2.5 with title "OpenPlex Status"
                    if the button returned of the result is "cancel" then return
                end tell
            end try
        end repeat
        set fileSize to 0
        set curTransferred to 0
        set curProgress to 0
        set one to 0
        set two to 0
        repeat until one = "Checking"
            try
                set lastLine to paragraph -1 of (do shell script "cat ~/Library/Application\\ Support/statusOP")
                set one to word 1 of lastLine
                set two to word 2 of lastLine
                set curProgress to word 3 of lastLine
                set fileSize to word 5 of lastLine
                set curTransferred to word 4 of lastLine
                -- deltas
                tell me
                    display dialog "Cloning OpenPlex...
                    
                    " & one & " " & two & " " & curTransferred & " / " & fileSize & " (" & curProgress & "%)" buttons {"Please Wait", "cancel"} default button "Please Wait" giving up after 2.5 with title "OpenPlex Status"
                    if the button returned of the result is "cancel" then return
                end tell
            end try
        end repeat
        tell me
            if one = "Checking" then
                display dialog "OpenPlex Cloning Complete, installing..." buttons {"Please Wait"} default button "Please Wait" giving up after 2.5
                if the button returned of the result is "cancel" then return
            end if
        end tell
        try
            do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
        end try
        do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
        do shell script "if grep -q '/usr/local/bin' '/etc/paths'; then echo exists; else echo '/usr/local/bin' >> /etc/paths; fi" with administrator privileges
        do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
        do shell script "chmod +x /Applications/PlexConnect/update/OSX/sudoers.bash" with administrator privileges
        do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
        do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
        do shell script "/Applications/PlexConnect/update/OSX/createplist.bash" with administrator privileges
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; purgesettingsbash.bash; restart.bash"
        do shell script "/Applications/PlexConnect/update/OSX/appwebhome.bash" with administrator privileges
        do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
        try
            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash; trashbasebash.bash"
        end try
        try
            do shell script "chmod -R 777 /Applications/PlexConnect" with administrator privileges
            do shell script "rm -R /Applications/PlexConnect" with administrator privileges
        end try
        
        tell application "Finder"
            if (exists folder "Applications:onlytemp" of the startup disk) then
                try
                    do shell script "rm -R /Applications/onlytemp"
                end try
            end if
            if (exists file "Applications:OpenPlex.zip" of the startup disk) then
                try
                    do shell script "cd /Applications; rm -R OpenPlex.app"
                    onerror
                end try
            end if
        end tell
        do shell script "mkdir /Applications/onlytemp"
        do shell script "cd /Applications/onlytemp; curl -O https://raw.githubusercontent.com/wahlmanj/installer/master/app.bash"
        do shell script "cd /Applications/onlytemp; chmod +x app.bash; ./app.bash" with administrator privileges
        do shell script "rm -R /Applications/onlytemp"
        try
            do shell script "cd ~/Library/Application\\ Support; rm statusOP"
        end try
        try
            do shell script "rm /Applications/clt.bash"
        end try
        display dialog "OpenPlex sucessfully installed, click icon located in your menubar, you can delete the installer app after you click ok..." buttons {"ok"} default button "ok" with title "OpenPlex Status"
        try
            do shell script "killall OpenPlex-installer"
        end try
    end applicationWillFinishLaunching:
    
    on applicationShouldTerminate:sender
        -- Insert code here to do any housekeeping before your application quits
        return current application's NSTerminateNow
    end applicationShouldTerminate:
    
end script


