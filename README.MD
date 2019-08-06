# My Vagrant files

## To set Vagrant Home
```
[System.Environment]::SetEnvironmentVariable('VAGRANT_HOME', 'C:\Vagrant\.vagrant.d', [System.EnvironmentVariableTarget]::Machine)
```

## Important commands
```
vagrant box add hashicorp/precise64
vagrant box remove hashicorp/precise64

vagrant init
vagrant init generic/alpine37 --box-version 1.9.18
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
    h.memory = 5024
    h.maxmemory = 5024
  end

end
```

Ubuntu 18.04 VM with 2034MB memory and 6 processors
```
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = 2034
    vb.cpus = 6
  end

end
```

## Box files
```
# frank @ ZERG in /g/Backup/VagrantBoxes [18:05:36] C:130
$ tree
.
├── StefanScherer
│   ├── windows_10
│   │   ├── StefanScherer_boxes_windows_10_versions_2019.07.11._providers_virtualbox.box
│   │   └── StefanScherer_boxes_windows_10_versions_2019.07.11_providers_hyperv.box
│   ├── windows_2019
│   │   ├── StefanScherer_boxes_windows_2019_versions_2019.05.22_providers_hyperv.box
│   │   └── StefanScherer_boxes_windows_2019_versions_2019.05.22_providers_virtualbox.box
│   └── windows_2019_docker
│       ├── StefanScherer_boxes_windows_2019_docker_versions_2019.07.22_providers_hyperv.box
│       └── StefanScherer_boxes_windows_2019_docker_versions_2019.07.22_providers_virtualbox.box
├── generic
│   ├── generic_boxes_alpine37_versions_1.9.16_providers_hyperv.box
│   └── generic_boxes_alpine37_versions_1.9.18_providers_hyperv.box
├── gusztavvargadr
│   ├── docker-windows
│   │   ├── gusztavvargadr_boxes_docker-windows_versions_1809.0.1906-community-windows-10-1903-enterprise_providers_hyperv.box
│   │   ├── gusztavvargadr_boxes_docker-windows_versions_1809.0.1906-community-windows-10-1903-enterprise_providers_virtualbox.box
│   │   ├── gusztavvargadr_boxes_docker-windows_versions_1809.0.1906-community-windows-server-1809-standard_providers_hyperv.box
│   │   ├── gusztavvargadr_boxes_docker-windows_versions_1809.0.1906-community-windows-server-1809-standard_providers_virtualbox.box
│   │   ├── gusztavvargadr_boxes_docker-windows_versions_1809.0.1906-enterprise-windows-server-1809-standard-core_providers_hyperv.box
│   │   ├── gusztavvargadr_boxes_docker-windows_versions_1809.0.1906-enterprise-windows-server-1809-standard-core_providers_virtualbox.box
│   │   ├── gusztavvargadr_boxes_docker-windows_versions_1809.0.1906-enterprise-windows-server-1809-standard_providers_hyperv.box
│   │   └── gusztavvargadr_boxes_docker-windows_versions_1809.0.1906-enterprise-windows-server-1809-standard_providers_virtualbox.box
│   ├── readme.txt
│   ├── ubuntu-server
│   │   ├── gusztavvargadr_boxes_ubuntu-server_versions_1604.0.1906-lts_providers_hyperv.box
│   │   └── gusztavvargadr_boxes_ubuntu-server_versions_1604.0.1906-lts_providers_virtualbox.box
│   ├── visual-studio
│   │   ├── gusztavvargadr_boxes_visual-studio_versions_2019.0.1906-community-windows-10-1903-enterprise_providers_hyperv.box
│   │   ├── gusztavvargadr_boxes_visual-studio_versions_2019.0.1906-community-windows-10-1903-enterprise_providers_virtualbox.box
│   │   ├── gusztavvargadr_boxes_visual-studio_versions_2019.0.1906-community-windows-server-1809-standard_providers_hyperv.box
│   │   └── gusztavvargadr_boxes_visual-studio_versions_2019.0.1906-community-windows-server-1809-standard_providers_virtualbox.box
│   ├── windows-10
│   │   ├── gusztavvargadr_boxes_windows-10_versions_1903.0.1906-enterprise_providers_hyperv.box
│   │   └── gusztavvargadr_boxes_windows-10_versions_1903.0.1906-enterprise_providers_virtualbox.box
│   └── windows-server
│       ├── gusztavvargadr_boxes_windows-server_versions_1809.0.1906-standard-core_providers_hyperv.box
│       ├── gusztavvargadr_boxes_windows-server_versions_1809.0.1906-standard-core_providers_virtualbox.box
│       ├── gusztavvargadr_boxes_windows-server_versions_1809.0.1906-standard_providers_hyperv.box
│       └── gusztavvargadr_boxes_windows-server_versions_1809.0.1906-standard_providers_virtualbox.box
├── misc
│   └── scoreyou_boxes_baseMac_versions_0.1_providers_virtualbox.box
└── temp
```

## Adding boxes from local disk example
Note the `Add-VagrantBox` function is from a module in my dotfiles
```
cd G:\Backup\VagrantBoxes\StefanScherer\windows_10
Add-VagrantBox -debug $true -filename .\StefanScherer_boxes_windows_10_versions_2019.07.11_providers_hyperv.box
mkdir E:\Vagrant\vagrantfiles\StefanScherer\windows_10\hyperv
cd E:\Vagrant\vagrantfiles\StefanScherer\windows_10\hyperv
vagrant init StefanScherer/windows_10 --box-version 2019.07.11
vagrant up
```
