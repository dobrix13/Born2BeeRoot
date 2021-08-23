# Born2BeeRoot 
_42cursus / 42wolfsburg.de_

## Instalation: ##

### 1: Install virtual box:
    Go to https://www.virtualbox.org/ and folow instructions.
### 2: Create new Virtual_Maschine and install OS of your choice
I have choosen Centos / RHEL. The reason for that is diffficult to explain. In my oppinion if you use minimal install without GUI tere's no big difference between distributiions. 
    
Ubuntu  |  Red Hat Linux/RHEL
------------- | -------------
Developed by canonical. |	Developed by Red Hat Sofware.
Ubuntu was initially released on 20 October 2004. |	RedHat was initially released on 13 may 1995.
Ubuntu is used for desktops or on server. |	RHEL can be used on desktops, on servers, in hypervisors or in the cloud.
Latest Ubuntu consists of the Gnome environment by default, though it allows you to change the same. |	Latest RHEL consists of Gnome based on the GTK+ 2 graphical toolkit environment by default, though it allows you to change the same.
Ubuntu is for general use or server use. |	RHEL is generally business oriented or for commercial use.
Ubuntu is a good option for beginners to Linux. |	RHEL is a good option for those who are intermediate in Linux and using it for commercial purposes.

### LVM (Logical Volume Manager)
Logical volume manager (LVM) introduces an extra layer between the physical disks and the file system allowing file systems to be :

> resized and moved easily and online without requiring a system-wide outage.
> 
> Using discontinuous space on disk.
> 
> meaningful names to volumes, rather than the usual cryptic device names.
> 
> span multiple physical disks.
    
![picture alt](https://access.redhat.com/webassets/avalon/d/Red_Hat_Enterprise_Linux-5-Deployment_Guide-en-US/images/9b9fc97cbd107fd1c1942a292b92feec/lvg.png)

![picture alt](https://access.redhat.com/webassets/avalon/d/Red_Hat_Enterprise_Linux-5-Deployment_Guide-en-US/images/60bf90643e32697025f671181b0f3de3/lvols.png)

### 3: use lvm to format disk
Create encrypted LVM_Group from installation GUI (use of strong password recomended)
Add necessary LV and mount points.
>
> /boot
> 
> /
> 
> /home
> 
> /var
> 
> /tmp
> 
> /srv
> 
> /var/log
  
### 4: install minimum server without GUI
### 5: configure ssh
Start by opening the /etc/ssh/sshd_config configuration file with nano or your preferred text editor.
search for line

    #Port 22
    #AddressFamily any
    #ListenAddress 0.0.0.0
    #ListenAddress ::

 Uncoment line port and cange 22 to <your_port_#>
 ### 6: Deny ssh root acces
 
    Permitrootlogin=no
### 7: configure selinux policy for ssh

    semanage port -a -t http_port_t -p tcp <your_custom_port #>
### 8: configure firewall
UFW isn’t available on the CentOS repository. We need to install the EPEL repository on our server.

    sudo dnf install epel-release -y

Now install and enable UFW:

#### install
    sudo dnf install ufw -y

#### enable
    sudo ufw enable

Check the status of UFW:

    sudo ufw status

To alow port <your_port_#>
    
    ufw allow <your_port_#>

### 9: customize password policy
a ery straight forward way to setup pasword policy is to edit /etc/security/pwquality.conf file with CL text editor. sudo permissions are needed
    
    /etc/security/pwquality.conf
    /etc/pam.d
    /etc/login.defs //password expiration dates
### 10: Banner: (just for fun!!!)
edit files in /etc/skel/ directory

### 11: Configuring sudo

Configure sudo via sudo vi /etc/sudoers.d/<filename>. <filename> shall not end in ~ or contain ..

$ sudo vi /etc/sudoers.d/<filename>

To limit authentication using sudo to 3 attempts (defaults to 3 anyway) in the event of an incorrect password, add below line to the file.

Defaults        passwd_tries=3

To add a custom error message in the event of an incorrect password:

Defaults        badpass_message="<custom-error-message>"

To log all sudo commands to /var/log/sudo/<filename>:

$ sudo mkdir /var/log/sudo
<~~~>
Defaults        logfile="/var/log/sudo/<filename>"
<~~~>

To archive all sudo inputs & outputs to /var/log/sudo/:

Defaults        log_input,log_output
Defaults        iolog_dir="/var/log/sudo"

To require TTY:

Defaults        requiretty

To set sudo paths to /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:

Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

12. Install mariadb
13. Install php
14. Install and configure wordpress
