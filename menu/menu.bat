@echo off
REM Custom help system.
REM 1. Create a [.menu] folder in your home directory [c:\users\yourname\.menu]
REM 2. Create a [menu.txt] file in the [.menu] folder as the main/default help panel.
REM 3. Create a [footer.txt] file in the [.menu] folder as a common footer help panel.
REM 4. Create a [edit.txt] file in the [.menu] folder as a common edit help panel.
REM    edit.txt contents:
REM
REM    Edit Commands
REM    ======================================================
REM    Menu edit edit          - Edit this edit info file.
REM    Menu edit menu          - Edit the main menu file.
REM    Menu edit footer        - Edit the footer file.
REM    Menu edit [topic]       - Edit the topic file.
REM
REM 5. Place this [menu.bat] file into a folder in your path.
REM ----
REM When at a DOS prompt, type [menu] for your custom help panels.

REM Test if the .menu folder exists in the user's home directory.
if exist %USERPROFILE%\.menu GOTO START
echo The .menu folder doesn't exist in your home directory.
echo.
echo Preparing to create the .menu folder in your home directory.
echo.
pause
echo -------------------------------------------------------------------
echo Creating a .menu folder in your home directory.
mkdir %USERPROFILE%\.menu

echo Creating a menu.txt file in the .menu folder.
echo Menu Commands > %USERPROFILE%\.menu\menu.txt
echo ====================================================== >> %USERPROFILE%\.menu\menu.txt
echo menu edit menu >> %USERPROFILE%\.menu\footer.txt

echo Creating a footer.txt file in the .menu folder.
echo Menu Commands >> %USERPROFILE%\.menu\footer.txt
echo ====================================================== >> %USERPROFILE%\.menu\footer.txt
echo menu edit footer >> %USERPROFILE%\.menu\footer.txt

echo Creating a edit.txt file in the .menu folder.
echo Edit Commands >> %USERPROFILE%\.menu\edit.txt
echo ====================================================== >> %USERPROFILE%\.menu\edit.txt
echo menu edit edit >> %USERPROFILE%\.menu\footer.txt   
echo menu edit menu >> %USERPROFILE%\.menu\footer.txt
echo menu edit footer >> %USERPROFILE%\.menu\footer.txt
echo menu edit [topic] >> %USERPROFILE%\.menu\footer.txt

echo The .menu folder has been created in your home directory.
echo The menu.txt, footer.txt, and edit.txt files have been created in the .menu folder.
echo Edit the menu.txt file to add your custom help panels.
echo Edit the footer.txt file to add your custom footer help panel.
echo Edit the edit.txt file to add your custom edit help panel.
echo.
echo When at a DOS prompt, type [menu] for your custom help panels.
GOTO EXIT0

:START

if !%1 == ! GOTO DISPLAYMENU
if %1 == edit GOTO EDITMENU

if exist %USERPROFILE%\.menu\%1.txt GOTO MENUFILEEXISTS
@echo A menu for %1 doesn't exist. Create one with: menu edit %1
GOTO EXIT0

:MENUFILEEXISTS
echo [93m
type %USERPROFILE%\.menu\%1.txt
echo [92m
type %USERPROFILE%\.menu\footer.txt
echo [0m
GOTO EXIT0

:DISPLAYMENU
echo [93m
type %USERPROFILE%\.menu\menu.txt
echo [92m
type %USERPROFILE%\.menu\footer.txt
echo [0m
GOTO EXIT0

:EDITMENU
if !%2 == ! GOTO SHOWEDIT
if not exist %USERPROFILE%\.menu\%2.txt GOTO MAKEMENU
if not !%2 == ! start notepad %USERPROFILE%\.menu\%2.txt
GOTO EXIT0

:MAKEMENU
if exist %USERPROFILE%\.menu\%2.txt GOTO EXIT0
echo %2 Commands >> %USERPROFILE%\.menu\%2.txt
echo ====================================================== >> %USERPROFILE%\.menu\%2.txt
echo menu %2 >> %USERPROFILE%\.menu\footer.txt
start notepad %USERPROFILE%\.menu\%2.txt
GOTO EXIT0

:SHOWEDIT
echo [93m
type %USERPROFILE%\.menu\EDIT.txt
echo [92m
type %USERPROFILE%\.menu\footer.txt
echo [0m
GOTO EXIT0

:EXIT0
