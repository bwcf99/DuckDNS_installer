#!/bin/bash

# Brent Fagersten
# 4/17/2017
# VT

# ¡¡Elevate to root and ~ before running!! ("sudo -i")

#CONFIG#
token="ce251e11-e710-416c-a931-962bc9a80dfa"
domain="vaag"
########

echo "Beginning DuckDNS install"

#Create DuckDNS directory/Duck.sh
mkdir duckdns
command="echo url='https://www.duckdns.org/update?domains=$domain"
command2="&token=$token"
command3="&ip=' | curl -k -o ~/duckdns/duck.log -K -"
fullCommand="$command$command2$command3"

touch duckdns/duck.sh
touch duckdns/clearDuckLog.sh
chmod 700 duckdns/duck.sh
chmod 700 duckdns/clearDuckLog.sh

echo "rm -rf ~/duckdns/duck.log" >> duckdns/clearDuckLog.sh

echo $fullCommand >> duckdns/duck.sh

#Create CronTab Entry
touch /etc/cron.d/duckdns.cron

crontab="*/5 * * * * ~/duckdns/duck.sh >/dev/null 2>&1"
crontab2="0 0 1 * * ~/duckdns/clearDuckLog.sh >/dev/null 2>&1" #delete logs once a month

echo "$crontab" >> /etc/cron.d/duckdns.cron
echo "$crontab2" >> /etc/cron.d/duckdns.cron

echo "Installation complete!"
echo "did you remember to edit the script config first? (y/n)\ny will delete installScript"
read answer
if ["$answer" = "n"]; then
  exit 130
else
  rm -rf ~/installDuckDNS.sh
  echo "DuckDNS installed and the installer has been removed!"
fi
