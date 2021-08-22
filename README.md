# Born2BeeRoot 
_42cursus / 42wolfsburg.de_

## Instalation: ##

1. Install virtual box:
    Go to https://www.virtualbox.org/ and folow instructions.
3. Create new VM and install OS of your choice
    *I have choosen Centos / RHEL*
    
Ubuntu  |  Red Hat Linux/RHEL
------------- | -------------
Developed by canonical. |	Developed by Red Hat Sofware.
Ubuntu was initially released on 20 October 2004. |	RedHat was initially released on 13 may 1995.
Ubuntu is used for desktops or on server. |	RHEL can be used on desktops, on servers, in hypervisors or in the cloud.
Latest Ubuntu consists of the Gnome environment by default, though it allows you to change the same. |	Latest RHEL consists of Gnome based on the GTK+ 2 graphical toolkit environment by default, though it allows you to change the same.
Ubuntu is for general use or server use. |	RHEL is generally business oriented or for commercial use.
Ubuntu is a good option for beginners to Linux. |	RHEL is a good option for those who are intermediate in Linux and using it for commercial purposes.

4. use lvm to format disk
5. use lvm encryption on volume group
6. install minimum server
7. configure ssh
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
