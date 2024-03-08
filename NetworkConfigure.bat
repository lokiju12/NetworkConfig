@echo off
pushd “%~dp0”
setlocal enabledelayedexpansion

Title 네트워크 점검

:MainMenu
cls
echo.
echo. 1. IP 확인
echo.
echo. 2. PING TEST [GATEWAY]
echo.
choice /C:12 /N /M   "번호 : "  
if errorlevel 2 goto :B
if errorlevel 1 goto :A

:A
for /f "tokens=1,* delims=:" %%a in ('ipconfig /all ^| findstr "IPv4"') do (
    set "result=%%b"
	cls
    echo.
	echo. IP 주소 : !result!
	echo.
	pause
)
goto MainMenu

:B
for /f "tokens=1,* delims=:" %%a in ('ipconfig /all ^| findstr "게이트웨이"') do (
    set "result=%%b"
	cls
    ping -t !result!
)
goto MainMenu

