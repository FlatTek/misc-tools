# WhereIs for Windows

This is a simple `whereis` implementation for Windows. It is a command line tool that lets you find the location of a program in your PATH.

You can use it to find the location of a program in your PATH.
- `whereis notepad.exe` will show you the location of Notepad.
- `whereis taskmgr.exe` will show you the location of Task Manager.
- `whereis explorer.exe` will show you the location of Windows Explorer.

## Installation

1. Download the script and save it to a directory in your PATH.
2. Make sure you have a directory in your PATH. You can check this by running `echo %PATH%` in a command prompt. If you don't have a directory in your PATH, you can add one by running `setx PATH "%PATH%;C:\path\to\directory"`.
3. At a command prompt, run `whereis notepad.exe` to see if it works. It should show you the location of Notepad.

This seems to work fine on machines that are locked down with group policies, but your mileage may vary.  As long as you CAN run apps, this should work.