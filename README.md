# Minix VM Setup Guide for VirtualBox and Dotfiles

# Dotfiles
If you wish to install my dotfiles, first you need to clone the respository.

`cp .shrc .vimrc ~`

First, we need to configure git. Type the following commands:

`git config --global user.name "<your username>"` replace `<your username>` with your GitHub account name.\
`git config --global user.email "<your email>"` replace `<your email> with your GitHub email address.`\
`git config --global http.sslVerify false` (this is not super secure however it seemed to be a necessary workaround in this case)\

# SSH
You will almost definitely wish to SSH into your VM. This will allow you to get multiple terminals going and dramatically improve
your workflow. An alternative to SSHing is simply editing the appopriate files on your host OS and transfering them over. GitHub, SCP,
or an FTP service work for this. However SSHing is recommended.

If we want to SSH or SCP for that matter, first we need to configure some settings for the VM on VirtualBox.

Click on the VM in the left hand side menu.

`Settings` -> `network` -> `advanced` -> `port forwarding`

Set `Host IP` to `127.0.0.1` and `Guest IP` to `10.0.2.15`

Make sure `Protocol` is `TCP` and set `Host Port` to `2222` (or any port you like but bare in mind we will use 2222 here)
and `Guest Port` to `22`.

## On Windows
Download the SSH client called (PuTTY)[https://www.putty.org/] and run with the following settings:

`Port: 2222` and `IP: 127.0.0.1`

##On MacOS and Linux
Make sure you have `OpenSSH` installed. On my Host OS, the command is `sudo pacman -S openssh`.

Once `OpenSSH` is installed, you can SSH into Minix with the following command:

`ssh -l root -p 2222 localhost`

## If you are using Termite on Linux while SSHing...
A problem I encountered on the Minix VM while SSHing from my ArchLinux Host OS was that my terminal,
TERMITE was bugging out horribly. The solution is to transfer the `termite.terminfo` file to Minix
(there is a copy included in this respository) and run the command `tic termite.terminfo`.

This may apply to other terminals as well. However the `.terminfo` file you need would be different.
Google should point you in the right direction here.

  To set up SSH on your VM, go into VirtualBox <b>settings -&gt; network -&gt;
  advanced -&gt; port forwarding...</b><br/> Then set <b>Host IP to 127.0.0.1 and guest IP
  to 10.0.2.15</b>. Also make sure <b>Protocol is TCP, Host Port is 2222 and
  Guest Port is 22</b>.

  [OPTIONAL: SSH into minix from host OS with ssh -l root -p 2222 localhost]<br/>
  [<b>If you are on Windows</b>, you can use Putty on port 2222 and IP 127.0.0.1]<br/>
  cd ~<br/>
  git clone https://www.github.com/housedhorse/minix-dotfiles<br/>
  cd minix-dotfiles<br/>
  [<b>If you are on Windows</b>, add "set fileformat=unix" to .vimrc without quotes]<br/>
  cp ./.&#42; ..<br/>
  [You will get warnings, that is OK]<br/>
  cp ./&#42; ..<br/>
  [You will get warnings, that is OK]<br/>
  cp -r ./.ssh ..<br/>
  [You MIGHT get warnings, that is OK]
