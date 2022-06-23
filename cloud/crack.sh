#!/bin/bash
wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
wget https://raw.githubusercontent.com/hashcat/hashcat/master/rules/dive.rule
## wget https://raw.githubusercontent.com/NotSoSecure/password_cracking_rules/master/OneRuleToRuleThemAll.rule
apt-get install vim #paste in hash to crack
