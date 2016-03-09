# vagrant-powerfit-disvis
This repository contains Vagrantfile, provisioners and assets required to build a VM for PowerFit and DisVis. 
This directory is based on haddocking/molmod repo on github, with added module for powerfit and disvis.
Base box for Vagrant is the modified version of joaorodrigues/courseVM. It has additionally Chimera 1.10.2 in it.

# Requirements
* Vagrant
* Virtual Box v 5.0.16 with Extension Pack
* Git
* 3-8 GB of disk space

# Build VM
```bash
git clone https://github.com/oyzeyno/vagrant-powerfit-disvis.git
cd vagrant-powerfit-disvis
vagrant up
vagrant ssh
su -l haddocker # password 'haddock'
```



