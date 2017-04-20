# DuckDNS_installer
Raspberry Pi installer for DuckDNS

**Run as root in the root home (~)!**

Raw download link "https://raw.githubusercontent.com/bwcf99/DuckDNS_installer/master/installDuckDNS.sh"


## Quick command
sudo -i

wget https://raw.githubusercontent.com/bwcf99/DuckDNS_installer/master/installDuckDNS.sh

chmod 700 installDuckDNS.sh

./installDuckDNS.sh

## Supported Operating Systems
Tested on Rasbian (Raspberry Pi 3)

*Should* work on Ubuntu/Centos

## Dependencies
- This Script/DuckDNS requires CronTab to be installed and running
- wget

## What does this script do?
- Creates duckdns folder in ~
- creates the duck.sh and ClearDuckLog.sh scripts inside the newly created folder
- Creates a cron file for DuckDNS and inserts the two cron jobs (5 min GET request, and once per month log flush)
- Finally removes the script (if the user wants to)
