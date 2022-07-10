#!/bin/bash

$1
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "${GREEN}---------------------Installing and updating---------------------\n"
printf "${NC}\n"

sudo apt autoremove
sudo apt install nmap -y
git clone https://github.com/vulnersCom/nmap-vulners
mv /root/nmap-vulners/vulners.nse /usr/share/nmap/scripts
sudo apt install gobuster -y


printf "${GREEN}---------------------Starting NMAP scan---------------------\n"
printf "${NC}\n"
sudo nmap -sS -sV -O -p- --script vulners -oN nmapscan.txt $1

printf "${GREEN}---------------------Starting Dirbuster scan---------------------\n"
printf "${NC}\n"
sudo gobuster dir -e -u http://$1 -w /usr/share/wordlists/dirb/common.txt