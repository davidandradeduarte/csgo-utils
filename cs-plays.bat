@echo off

rem Handy script to start/close vibranceGUI, PrimaryLock and PlaysTV with csgo

rem ## 1. Start Processes ##

start C:\Users\David\AppData\Local\Plays\Plays.exe
echo Plays started

start D:\Others\vibranceGUI\vibranceGUI.exe
echo vibranceGUI started

start D:\Others\PrimaryLock\PrimaryLock.exe
echo PrimaryLock started

start steam://rungameid/730
echo csgo started

rem ## 2. Wait until csgo opens, and start looping to check when it has been closed ##

rem If csgo is not running yet, loop
echo waiting for csgo to start
:firstloop
tasklist /FI "IMAGENAME eq csgo.exe" 2>NUL | find /I /N "csgo.exe">NUL
if "%ERRORLEVEL%" NEQ "0" goto firstloop
echo csgo is running

rem When csgo runs for the first time, lets loop again
rem If csgo is not running anymore, means it was closed
echo waiting for csgo to exit
:secondloop
tasklist /FI "IMAGENAME eq csgo.exe" 2>NUL | find /I /N "csgo.exe">NUL
if "%ERRORLEVEL%"=="0" goto secondloop
echo csgo has been closed 

rem ## 3. Kill Processes ##

taskkill /f /im "PrimaryLock.exe"
echo PrimaryLock closed

taskkill /f /im "vibranceGUI.exe"
echo vibranceGUI closed

taskkill /f /im "Plays.exe"
echo Plays closed

echo done :)
rem echo press enter to exit
rem pause >nul
exit