# SUDO for Windows

This is a simple sudo implementation for Windows. It is a command line tool that lets you run commands as admin, just like you would on Linux/Unix or OS X.

You can use it to run a single command as admin, or you can run a command prompt as admin.
- `sudo taskmgr` will run Task Manager as admin.
- `sudo cmd` will run a command prompt as admin.
- `sudo notepad` will run Notepad as admin.
- `sudo notepad C:\Windows\System32\drivers\etc\hosts` will open the hosts file in Notepad as admin. (MY FAVORITE!)

## Installation

1. Download the two scripts (one for batch and one for PowerShell) and save them to a directory in your PATH.
2. Make sure you have a directory in your PATH. You can check this by running `echo %PATH%` in a command prompt. If you don't have a directory in your PATH, you can add one by running `setx PATH "%PATH%;C:\path\to\directory"`.
3. Make sure you have PowerShell available. This is also a standard Windows command, so it should be available on all Windows systems.
4. At a command prompt, run `sudo taskmgr` to see if it works. Task-Manager should start as admin.

This seems to work fine on machines that are locked down with group policies, but your mileage may vary.  As long as you CAN run apps as admin, this should work.
