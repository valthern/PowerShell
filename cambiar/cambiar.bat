@echo off
rem icacls "%cd%" /grant %USERNAME%:RX /T
pause
powershell.exe -ExecutionPolicy Bypass -File ".\cambiar.ps1"
@echo on