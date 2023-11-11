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

BEST_66=best66.rule
if [ -f "$BEST_66" ]; then
    echo "$BEST_66 exists."
else
    echo "Downloading the Best 66 rule..."
    wget -q https://raw.githubusercontent.com/hashcat/hashcat/master/rules/best66.rule
fi

ROCK_FILE=rockyou-withcount.txt
if [ -f "$ROCK_FILE" ]; then
    echo "$ROCK_FILE exists."
else
    echo "Downloading the Rock You wordlist..."
    wget -q https://github.com/danielmiessler/SecLists/raw/master/Passwords/Leaked-Databases/rockyou-withcount.txt.tar.gz
    tar -xf rockyou-withcount.txt.tar.gz
fi

echo "💀 |   Using Best66 rule"
hashcat -a 0 -m 22000 $1 -w 3 --quiet --session vast -r best66.rule rockyou-withcount.txt

ROCKYOU30=rockyou-30000.rule
if [ -f "$ROCKYOU30" ]; then
    echo "$ROCKYOU30 exists."
else
    echo "Downloading the RockYou 30000 rule..."
    wget -q https://github.com/hashcat/hashcat/raw/master/rules/rockyou-30000.rule
fi

echo "💀 |   Using RockYou 30000 rule"
hashcat -a 0 -m 22000 $1 -w 3 --quiet --session vast -r rockyou-30000.rule rockyou-withcount.txt

#ORTRTE_FILE=OneRuleToRuleThemAll.rule
#if [ -f "$ORTRTE_FIL" ]; then
#    echo "$ORTRTE_FIL exists."
#else 
#    wget https://raw.githubusercontent.com/NotSoSecure/password_cracking_rules/master/OneRuleToRuleThemAll.rule
#fi
#echo "💀 |   Using OneRuleToRuleThemAll rule"
#hashcat -a 0 -m 22000 $1 -w 3 --quiet -r OneRuleToRuleThemAll.rule rockyou.txt

echo "############################################################"
echo "##               Trying Passphrase attack                 ##"
echo "############################################################"
PASSPHRASE_LIST=passphrases.txt
if [ -f "$PASSPHRASE_LIST" ]; then
    echo "$PASSPHRASE_LIST exists."
else
    echo "Downloading passphrases..."
    wget -q https://github.com/initstring/passphrase-wordlist/releases/download/v2022.1/passphrases.txt
fi
PASSPHRASE_RULE_1=passphrase-rule1.rule
if [ -f "$PASSPHRASE_RULE_1" ]; then
    echo "$PASSPHRASE_RULE_1 exists."
else 
    echo "Downloading passphrase rule 1"
    wget -q https://github.com/initstring/passphrase-wordlist/raw/master/hashcat-rules/passphrase-rule1.rule
fi
PASSPHRASE_RULE_2=passphrase-rule2.rule
if [ -f "$PASSPHRASE_RULE_2" ]; then
    echo "$PASSPHRASE_RULE_2 exists."
else 
    echo "Downloading passphrase rule 2"
    wget -q https://github.com/initstring/passphrase-wordlist/raw/master/hashcat-rules/passphrase-rule2.rule
fi
echo "💀 |   Executing Passphrase Attack"
hashcat -a 0 -m 22000 $1 passphrases.txt --quiet -r passphrase-rule1.rule -r passphrase-rule2.rule  -w 3
