@echo off

rem Handy script to start/close vibranceGUI and PrimaryLock with csgo

rem ## 1. Start Processes ##

start "" "D:\Program Files\FACEIT AC\faceitclient.exe"
echo faceitclient started
rem FACEIT AC takes a bit to load, so wait for it
echo waiting for faceitclient to start
:faceitloop
tasklist /FI "IMAGENAME eq faceitclient.exe" 2>NUL | find /I /N "faceitclient.exe">NUL
if "%ERRORLEVEL%" NEQ "0" goto faceitloop
rem Wait some additional time, because it takes a bit to verify, etc
echo waiting 5 seconds for faceitclient to load
timeout /t 10 /nobreak > NUL
echo faceitclient is running

start D:\Others\vibranceGUI\vibranceGUI.exe
echo vibranceGUI started

start D:\Others\PrimaryLock\PrimaryLock.exe
echo PrimaryLock started

start steam://rungameid/730
echo csgo started

echo done :)
rem echo press enter to exit
rem pause >nul
exit