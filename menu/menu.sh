#!/bin/bash

echo
# REM Custom help system.

if [ ! -d ~/.menu ]; then
  mkdir ~/.menu
  echo "Created ~/.menu directory."
fi

if [ ! -f ~/.menu/footer.txt ]; then
  echo "Topics:" > ~/.menu/footer.txt
  echo "======================================================" >> ~/.menu/footer.txt
  echo "menu edit            - Display the Edit menu" >> ~/.menu/footer.txt
  echo "menu system          - Display the System menu" >> ~/.menu/footer.txt
  echo "Created FOOTER.TXT file."
fi

if [ ! -f ~/.menu/menu.txt ]; then
  echo "Interesting Commands:" > ~/.menu/menu.txt
  echo "======================================================" >> ~/.menu/menu.txt
  echo "which <command_name>          - Locates command on path" >> ~/.menu/menu.txt
  echo "Created MENU.TXT file."
fi

# No paranters on the command line
if [ -z "$1" ]; then
  echo -e " \e[1;33m"
  cat ~/.menu/menu.txt
  echo -e " \e[1;32m"
  cat ~/.menu/footer.txt
  echo -e "\e[0m"
  exit 0
fi

# EDIT as the first parameter on the command line
if [ "$1" == "edit" ]; then
  # Was there a filename on the command line for the edit.
  if [ -z "$2" ]; then
    echo -e " \e[1;33m"
    cat ~/.menu/edit.txt
    echo -e " \e[1;32m"
    cat ~/.menu/footer.txt
    echo -e "\e[0m"
    exit 0
  fi
  if test -f ~/.menu/$2.txt; then
    nano ~/.menu/$2.txt
  else
    echo "$2 Commands" >> ~/.menu/$2.txt
    echo "======================================================" >> ~/.menu/$2.txt
    echo "menu" $2 >> ~/.menu/footer.txt
    nano ~/.menu/$2.txt
    exit 0
  fi
fi

# First parameter is a menu file to be displayed
# Does it exist?
if test -f ~/.menu/$1.txt; then
  echo -e " \e[1;33m"
  cat ~/.menu/$1.txt
  echo -e " \e[1;32m"
  cat ~/.menu/footer.txt
  echo -e "\e[0m"
  exit 0
else
  echo -e "\e[1;31mA menu for $1 doesn't exist. \e[1;33mCreate one with: \e[1;32mmenu edit $1\e[0m"
  exit 0
fi