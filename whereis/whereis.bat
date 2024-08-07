@echo off
setlocal
setlocal enableextensions
setlocal enabledelayedexpansion

echo.
for %%H in ("help" "/help" "-help" "/h" "-h") DO (
   if /I "%1"=="%%~H" GOTO USAGE
)
GOTO NOUSAGE
:USAGE 
echo Locate a file/program by looking in the defined PATHs of this session.
echo Usage: WhereIs file_to_find   ..locate this file
echo.
GOTO END
:NOUSAGE 

set P=%PATH%
set LFILE=%1
if "."==".%LFILE%" GOTO USAGE
:pathloop
for /F "delims=; tokens=1*" %%f in ("!P!") do (
    set F=%%f

    if exist %%f\%LFILE% goto found
    set P=%%g
)
if defined P goto pathloop

echo File %LFILE% was not found!
goto end

:found
set location=%F%\%LFILE%
set location=%location:\\=\%
echo %location%
goto end

:end