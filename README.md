
# Rem devenv

Uses vagrant and ansible (only on the guest machine) to create provisioned desktop dev environment from scratch.

## Prereqs

Vagrant
Some supported Hypervisor (e.g., VirtualBox)

## Notes

* If using VirtualBox: Before starting the virtual machine install Vagrant Virtualbox Guest Additions plugin: `vagrant plugin install vagrant-vbguest`
* The user name that is created is in /provisioning/roles/user/tasks/main.yml.  To specify a password a hash must be used.  To get the has, from a unix command prompt use: `mkpasswd -m sha-512 MySecretPassword`.
* Use `vagrant reload` after initial install.
* dotfiles can be found in dotfiles directory. *They must edited from unix for the lined endings to be correct* 

## Main things installed

* OS: Ubuntu 18.04
* Java
* Visual Studio Code

## Misc

* The vscode ansible role requires a fully qualified name for the extensions to be installed after vscode is installed.  The only way I have found to get them.  Assuming vscode is installed on the host machine then, from the command line: `code --list-extensions`.

## Forked from

Much thanks for the starter ...

This is a sample project which is described in the blog post "Automated Setup of Software Development Environment" published on the [mimacom blog](https://blog.mimacom.com/automated-setup-of-software-development-environment/).