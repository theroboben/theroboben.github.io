@echo off
setlocal enabledelayedexpansion
set /P name="New Code: "
call:DoReplace "CODE" "%name%" template.html index.html
exit /b

:DoReplace
echo ^(Get-Content "%3"^) ^| ForEach-Object { $_ -replace %1, %2 } ^| Set-Content %4>Rep.ps1
Powershell.exe -executionpolicy ByPass -File Rep.ps1
if exist Rep.ps1 del Rep.ps1