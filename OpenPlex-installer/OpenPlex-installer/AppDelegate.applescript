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
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
        try
            do shell script "killall OpenPlex"
        end try
        display dialog "Installing OpenPlex, Git version 2.2.1, System Wide Python version 2.7.9 (patched for your firewall if needed), this will take quite some time depending on your ISP..." with title "OpenPlex Status"
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
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "stopbash.bash"
                            do shell script "trashbasebash.bash"
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
                display dialog "No OpenPlex folder detected, this will take quite some time to install..." with title "OpenPlex Status"
                delay 0
                try
                    do shell script "rm -R ~/Library/Application\\ Support/OpenPlex" with administrator privileges
                end try
                do shell script "cd ~/Library/Application\\ Support; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/OpenPlex.git"
                try
                    do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                end try
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/sudoers.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/createplist.bash" with administrator privileges
                do shell script "purgesettingsbash.bash; restart.bash"
                do shell script "/Applications/PlexConnect/update/OSX/appwebhome.bash" with administrator privileges
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                    if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end if
            try
                do shell script "stopbash.bash"
                do shell script "trashbasebash.bash"
            end try
            try
                do shell script "chmod -R 777 /Applications/PlexConnect" with administrator privileges
                do shell script "rm -R /Applications/PlexConnect" with administrator privileges
            end try
            if (exists folder "Applications:onlytemp" of the startup disk) then
                do shell script "rm -R /Applications/onlytemp"
            end if
            if (exists file "Applications:OpenPlex.zip" of the startup disk) then
                try
                    do shell script "cd /Applications; rm -R OpenPlex.app"
                    onerror
                end try
            end if
        end tell
        do shell script "mkdir /Applications/onlytemp"
        do shell script "cd /Applications/onlytemp; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/installer.git"
        do shell script "cd /Applications/onlytemp/installer; chmod +x app.bash; ./app.bash" with administrator privileges
        do shell script "rm -R /Applications/onlytemp"
        display dialog "OpenPlex sucessfully installed, click icon located in your menubar, you can delete the installer app after you click ok..." with title "OpenPlex Status"
        try
            do shell script "killall OpenPlex-installer"
        end try
    end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script