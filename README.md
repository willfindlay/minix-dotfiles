# Minix VM Setup Guide for VirtualBox and Dotfiles

# Setup
First, download [Virtual Box](https://www.virtualbox.org/) and make sure it is up to date.

## Using the Provided Image
Download the provided VDI file, and in VirtualBox select `file` -> `import appliance` and navigate to the VDI file you downloaded.

## Installing Programs

If necessary, install vim: `pkgin up && pkgin in vim`. When it prompts you to update the database, type `y`.
If necessary, install openssh: `pkgin install openssh` and `reboot`.

# Where is my GUI???
Minix doesn't come with a GUI. The only interface you get is a terminal. This can be a culture shock to some people.
Luckily, there are a couple techniques to make your life a little easier which are discussed briefly in the [SSH](#SSH) section
of this guide.

If you are dead-set on using an IDE, just work on the assignments on your Host OS and transfer them over to the Minix VM
using one of the techniques outlined below.

# SSH
You will almost definitely wish to SSH into your VM. This will allow you to get multiple terminals going and dramatically improve
your workflow. An alternative to SSHing is simply editing the appopriate files on your host OS and transfering them over. SCP,
or an FTP service work for this. However SSHing is recommended.

If we want to SSH or SCP for that matter, first we need to configure some settings for the VM on VirtualBox.

Click on the VM in the left hand side menu.

`Settings` -> `network` -> `advanced` -> `port forwarding` -> `add rule` (if one doesn't exist in your image already)

Set `Host IP` to `127.0.0.1` and `Guest IP` to `10.0.2.15`

Make sure `Protocol` is `TCP` and set `Host Port` to `2222` (or any high numbered port you like but bear in mind I will use 2222 here)
and `Guest Port` to `22`.

## On Windows
Download the SSH client called [PuTTY](https://www.putty.org/) and run with the following settings:

`Port: 2222` and `IP: 127.0.0.1`

## On MacOS and Linux
Make sure you have `OpenSSH` installed. On my Host OS, the command is `sudo pacman -S openssh`.

Once `OpenSSH` is installed, you can SSH into Minix with the following command:

`ssh -l root -p 2222 localhost`

# Dotfiles
If you wish to use my custom dotfiles which make Vim and Minix a little bit more useable, follow these isntructions.
Otherwise, just skip this section.

Clone the repository and copy the dotfiles to your host OS and SCP the dotfiles over.

`git clone https://www.github.com/housedhorse/minix-dotfiles`
`cd minix-dotfiles`

In a terminal on your Host OS, type: `scp -P 2222 .vimrc .shrc root@localhost:~/` **Please note the uppcase -P here!**

# Some helpful commands 

`scp`: \
Once you have your SSH configured on Host OS and the VM, you can transfer files from your Host OS to your Guest OS with the following
command in your Host OS terminal: `scp -P 2222 /path/to/files root@localhost:/path/where/you/want/them`. Conversely to transfer in the other direction, flip it: `scp -P 2222 root@localhost:/path/to/files /path/where/you/want/them`.

## If you are using Termite on Linux while SSHing...
A problem I encountered on the Minix VM while SSHing from my ArchLinux Host OS was that my terminal,
Termite was bugging out horribly. The solution is to transfer the `termite.terminfo` file to Minix
(there is a copy included in this respository) and run the command `tic termite.terminfo`.

This may apply to other terminals as well. However the `.terminfo` file you need would be different.
Google should point you in the right direction here.

# That's about it!

Thanks for reading and hopefully this helped somebody get their setup just right.
