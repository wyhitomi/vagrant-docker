# Vagrant-Docker
This repo uses an ubuntu xenial box to start a virtual machine with docker and git

## Config
On folder "provision", use the provided scripts to include anything you desire.
- setup.sh: this shell script installs the desired packages
  -  (docker, git and node)
- validate.sh: this shows what have been installed
- git_repo.sh: put here the repos you want to automatically clone
- container_bootup.sh: put here docker commands to start automatically woth the provision

## Running

```
// start the vagrant box (xenial), using virtualbox default provider
vagrant up

// rebuild the box
vagrant provision

// destroy box
vagrant destroy
```
