@echo off
SET KEY_PATH=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization
SET VALUE_NAME=NoLockScreen
SET DATA=1
REM Check if the key exists
reg query "%KEY_PATH%" >nul 2>&1
REM If the key does not exist, create it
IF %ERRORLEVEL% EQU 1 (
    reg add "%KEY_PATH%"
)
REM Create the DWORD value and set it to 1
reg add "%KEY_PATH%" /v "%VALUE_NAME%" /t REG_DWORD /d "%DATA%" /f