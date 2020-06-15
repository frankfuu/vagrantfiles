
# Common additional dependencies 
 - [Oracle VM VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)

# List of plugins
https://github.com/hashicorp/vagrant/wiki/Available-Vagrant-Plugins


## To download more boxes
```
vagrant box add gusztavvargadr/windows-10 --box-version 1909.0.2003-enterprise --provider virtualbox
```

## To use templates for virtualbox on linux
```
# this creates a file named Vagrantfile in ~/gusztavvargadr/windows-10 folder and populates it with a vagrant file with gusztavvargadr/windows-10 using version 1903.0.1906-enterprise

./bootstrap.sh gusztavvargadr/windows-10 1903.0.1906-enterprise
```

## To use templates for hyperv on windows via powershell
```
# this creates a file named Vagrantfile in ~/machines/gusztavvargadr/windows-10 folder and populates it with a vagrant file with gusztavvargadr/windows-10 using version 2004.0.2005
.\bootstrap.ps1 -boxName gusztavvargadr/windows-10 -boxVersion 2004.0.2005
```