param(
    [string]$boxName, 
    [string]$boxVersion
)

Write-Host boxName : $boxName # e.g. // gusztavvargadr/windows-10
Write-Host boxVersion : $boxVersion # e.g. // 1903.0.1906-enterprise

$targetDir = "$env:USERPROFILE\machines\$boxName"

mkdir -Path $targetDir
Copy-Item .\templates\hyperv\Vagrantfile $targetDir
sed -i "s|boxName|$boxName|" $targetDir\Vagrantfile
sed -i "s|boxVersion|$boxVersion|" $targetDir\Vagrantfile

cd $targetDir
vagrant up

# mkdir -p ~/machines/$boxName
# cp templates/virtualbox/Vagrantfile $_
# sed -i "s|boxName|$boxName|" $_/Vagrantfile
# sed -i "s|boxVersion|$boxVersion|" $_
# cd ~/machines/$boxName

# echo bringing up $boxName on version $boxVersion ... 
# vagrant up