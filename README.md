# usbcopyfiles
Powershell to quickly change the horn sounds on Big Bubba digital horn


This script checks for USB drive present, then erases it and copies new mp3 sounds to the root of the usb.

Example: A folder named "Starwars" with 4 mp3 files on your local path in windows.

Warning. This will DELETE your data on your usb drive!!!

Usage:

Configure the path file in the copytousb.ps1 file to match your mp3 folder parent paths.

powershell -file copytousb.ps1 "Starwars"
