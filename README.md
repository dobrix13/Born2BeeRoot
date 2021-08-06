# Born2BeeRoot
42wolfsburg.de project

1. Install virtual box 
2. Create new VB and install centos
3. use lvm to format disk
4. use lvm encryption on volume group
5. install minimum server
6. configure ssh
    /etc/ssh/sshd_config
    Use port ####
    Permitrootlogin=no
7. configure selinux policy for ssh
    Semanage..... 
8. configure firewall
    Install ufw
    Add port ####/tcp
9. customize password policy
    /etc/pam.d
    /etc/login.defs //password expiration dates
10. Banner:
Use ascii art online to generate ascii art banner
Save it then use cat on it on bashrc login
11. Instal lighttpd
12. Install mariadb
13. Install php
14. Install and configure wordpress
