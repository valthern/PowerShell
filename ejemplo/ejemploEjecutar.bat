@echo off
echo Soy un archivo .BAT y pretendo ejecutar un script de PowerShell
pause
powershell.exe -ExecutionPolicy Bypass -File ".\ejecutame.ps1"
@echo on