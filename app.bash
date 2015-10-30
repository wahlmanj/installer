#!/bin/sh
OSX_VERS=$(sw_vers -productVersion | awk -F "." '{print $2}')

if [ "$OSX_VERS" -eq 6 ]; then
cd /Applications
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
ditto -xk OpenPlex.zip /Applications
rm OpenPlex.zip
open OpenPlex.app
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 7 ]; then
cd /Applications
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
ditto -xk OpenPlex.zip /Applications
rm OpenPlex.zip
open OpenPlex.app
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 8 ]; then
cd /Applications
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
ditto -xk OpenPlex.zip /Applications
rm OpenPlex.zip
open OpenPlex.app
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 9 ]; then
cd /Applications
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
ditto -xk OpenPlex.zip /Applications
rm OpenPlex.zip
open OpenPlex.app
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 10 ]; then
cd /Applications
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
ditto -xk OpenPlex.zip /Applications
rm OpenPlex.zip
open OpenPlex.app
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 11 ]; then
cd /Applications
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
ditto -xk OpenPlex.zip /Applications
rm OpenPlex.zip
open OpenPlex.app
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 12 ]; then
cd /Applications
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
ditto -xk OpenPlex.zip /Applications
rm OpenPlex.zip
open OpenPlex.app
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 13 ]; then
cd /Applications
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
ditto -xk OpenPlex.zip /Applications
rm OpenPlex.zip
open OpenPlex.app
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 14 ]; then
cd /Applications
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
ditto -xk OpenPlex.zip /Applications
rm OpenPlex.zip
open OpenPlex.app
echo $OSX_VERS
fi
