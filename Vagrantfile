# -*- mode: ruby -*-
# vi: set ft=ruby :


# Fatto due versioni di Adminer:
# wget (http://192.168.56.10 o http://192.168.56.10/index.php)
# synced folder (http://192.168.56.10/adminer.php)
# Non ho pensato di farlo direttamente con il synced folder...
# Lascio comunque tutti e due perché anche wget è interessante :)

Vagrant.configure("2") do |config|
  WEB_NAME = "web.m340"
  DB_NAME = "db.m340"
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  BOX_NAME = "ubuntu/jammy64"
  VM_MEMORY = 2048
  VM_CPUS = 2

  config.vm.define "web" do |subconfig|
    subconfig.vm.box = BOX_NAME
    subconfig.vm.provision "shell", path: "web.sh"
    subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: "intnet"
    subconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10"

    subconfig.vm.synced_folder "html", "/var/www/html"

    subconfig.vm.hostname = WEB_NAME
    subconfig.vm.provider "virtualbox" do |vb|
        vb.name = WEB_NAME
        vb.memory = VM_MEMORY
        vb.cpus = VM_CPUS
    end
  end

  config.vm.define "db" do |subconfig|
    subconfig.vm.box = BOX_NAME
    subconfig.vm.provision "shell", path: "db.sh"
    subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: "intnet"

    subconfig.vm.hostname = DB_NAME
    subconfig.vm.provider "virtualbox" do |vb|
        vb.name = DB_NAME
        vb.memory = VM_MEMORY
        vb.cpus = VM_CPUS
    end
  end
end