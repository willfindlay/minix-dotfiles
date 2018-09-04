# Minix VM Setup Guide for VirtualBox and Dotfiles

# Setup
First, download [Virtual Box](https://www.virtualbox.org/) and make sure it is up to date.

## Use the Provided Image
Download the provided VDI file, and in VirtualBox select `file` -> `import appliance` and navigate to the VDI file you downloaded.

## Manual Install
### Configuring the VM
Now, you can download the [Minix 3.3.0 (stable) ISO from the Minix website](https://wiki.minix3.org/doku.php?id=www:download:start).

Once the ISO is downloaded, open VirtualBox.

Go to `Machine` -> `New`. Type any name you like such as `COMP3000 Minix`. Under `Type`, select `Other`. Under `Version`, select
`Other/Uknown`. **DO NOT SELECT** `Other/Unknown 64-bit`.

Now, we need to allocate RAM from our Host OS to the VM. `1024`, for example, is a decent number, although you may want to go
higher or lower depending on the specs of your computer.

Next, we allocate a Virtual Hard Disk for the VM. These setting should be OK at their defaults but it doesn't hurt to make
it a little bigger if you like. Press `Create` to continue. On the next screen, leave it on `VDI` and press `Next`. Finally, I
would recommend choosing `Fixed Size`, however depending on your system specs you may want `Dynamic` instead.

Go through the next couple screens, and you should be ready to install Minix.

### Installing Minix

First, extract the Minix ISO file from the `.bz2` file you downloaded with `bzip2 -dk <filename>`.

Right click on the `Minix` virtual machine in the left hand side menu and click `start` -> `normal start`.

Virtual Box will prompt you to choose a bootable image. Navigate to where your Minix ISO file was saved and select that.

You can just do nothing here and it will automatically select the best option. After a few seconds in my case, you should
be ready to log in and start the install script. All the default settings should be okay here.

When the script finishes, close your VM and select `power off`.

Remove your installation media in Virtual Box by right clicking your VM and going to `settings` -> `storage` right clicking your ISO
file, which should have a CD icon, and clicking `remove attachment`.

Now, you can boot your VM again.

## Installing Programs

If necessary, install vim: `pkgin up && pkgin in vim`. When it prompts you to update the database, type `y`.

# Where is my GUI???
Minix doesn't come with a GUI. The only interface you get is a terminal. This can be a culture shock to some people.
Luckily, there are a couple techniques to make your life a little easier which are discussed briefly in the [SSH](#SSH) section
of this guide.

If you are dead-set on using an IDE, just work on the assignments on your Host OS and transfer them over to the Minix VM
using one of the techniques outlined below.

# Dotfiles
If you wish to use my custom dotfiles which make Vim and Minix a little bit more useable, follow these isntructions.
Otherwise, just skip this section.

First, we need to configure git. Type the following commands:

`git config --global user.name "<your username>"` replace `<your username>` with your GitHub account name.\
`git config --global user.email "<your email>"` replace `<your email> with your GitHub email address.`\
`git config --global http.sslVerify false` (this is not super secure however it seemed to be a necessary workaround in this case)

Now, clone the repository and copy the dotfiles:

`git clone https://www.github.com/housedhorse/minix-dotfiles`
`cd minix-dotfiles`
`cp .shrc .vimrc ~`

# SSH
You will almost definitely wish to SSH into your VM. This will allow you to get multiple terminals going and dramatically improve
your workflow. An alternative to SSHing is simply editing the appopriate files on your host OS and transfering them over. GitHub, SCP,
or an FTP service work for this. However SSHing is recommended.

If we want to SSH or SCP for that matter, first we need to configure some settings for the VM on VirtualBox.

Click on the VM in the left hand side menu.

`Settings` -> `network` -> `advanced` -> `port forwarding`

Set `Host IP` to `127.0.0.1` and `Guest IP` to `10.0.2.15`

Make sure `Protocol` is `TCP` and set `Host Port` to `2222` (or any port you like but bear in mind I will use 2222 here)
and `Guest Port` to `22`.

## On Windows
Download the SSH client called [PuTTY](https://www.putty.org/) and run with the following settings:

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

# That's about it!

Thanks for reading and hopefully this helped somebody get their setup just right.
