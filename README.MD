
# Common additional dependencies 
 - [Oracle VM VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)

# List of plugins
https://github.com/hashicorp/vagrant/wiki/Available-Vagrant-Plugins

## Usage

Powershell under windows
```
# copy template over
Copy-Item -r .\templates\virtualbox\bento\ubuntu-18.04\ $env:USERPROFILE\machines\ub1804 -force

# check copied contents
gci $env:USERPROFILE\machines\ub1804

# install other dependencies
vagrant plugin install vagrant-disksize
vagrant plugin install vagrant-vbguest

# bring up environment
cd $env:USERPROFILE\machines\ub1804; vagrant up

# undo above
Remove-Item -r $env:USERPROFILE\machines\ub1804
```

## To download more boxes
```
vagrant box add gusztavvargadr/windows-10 --box-version 1909.0.2003-enterprise --provider virtualbox
```

## To init
```
vagrant init gusztavvargadr/windows-10 --box-version 1909.0.2003-enterprise
```

## To use templates
```

# this creates a file named Vagrantfile in ~/machines/generic/10 folder and opens it in vim

mkdir -p ~/machines/generic/debian10 && cp templates/virtualbox/Vagrantfile $_
vim $_/Vagrantfile 
```
