# My Vagrant files

## To set Vagrant Home
```
[System.Environment]::SetEnvironmentVariable('VAGRANT_HOME', 'C:\Vagrant\.vagrant.d', [System.EnvironmentVariableTarget]::Machine)
```

## Important commands
```
vagrant box add hashicorp/precise64 --provider hyperv
vagrant init
vagrant init generic/alpine37 --box-version 1.9.18\
vagrant up
vagrant up --provider-hyperv

vagrant status
vagrant reload

vagrant suspend
vagrant resume
vagrant halt
vagrant destroy

vagrant ssh
vagrant rdp

# lists all vagrant machines currently on computer
vagrant global-status
vagrant global-status --prune
vagrant destroy -f the_id_of_the_machine
```

## Vagrant file examples
Use Hyper-V as a provider and set 6 processors and 8 gb memory
```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "gusztavvargadr/visual-studio"

  config.vm.provider "hyperv" do |h|
    h.cpus = 6
    h.memory = "8024"
  end

end
```

Ubuntu 18.04 VM with 2034MB memory and 6 processors
```
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "2034"
    vb.cpus = 6
  end

end
```