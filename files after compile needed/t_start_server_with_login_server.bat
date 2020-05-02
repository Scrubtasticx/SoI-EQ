@echo off
cls
echo *** CLEARING OLD LOGS ***
del "logs/zone/" /q
shared_memory.exe
start perl win_server_launcher.pl zones="30" zone_background_start loginserver kill_all_on_start
TIMEOUT 30
start discordeq-0.52.0-windows-x86.exe
exit
