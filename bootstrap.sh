# Usage
# ./bootstrap.sh gusztavvargadr/windows-10 1903.0.1906-enterprise

function_name() {
    local boxName=${1}
    local boxVersion=${2}    

    echo boxName : $boxName             # e.g. // gusztavvargadr/windows-10
    echo boxVersion : $boxVersion       # e.g. // 1903.0.1906-enterprise

    mkdir -p ~/machines/$boxName
    cp templates/virtualbox/Vagrantfile ~/machines/$boxName
    sed -i "s|boxName|$boxName|" ~/machines/$boxName/Vagrantfile
    sed -i "s|boxVersion|$boxVersion|" ~/machines/$boxName/Vagrantfile
    cd ~/machines/$boxName

    echo bringing up $boxName on version $boxVersion ... 
    vagrant up
}




function_name $1 $2