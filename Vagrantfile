# -*- mode: ruby -*-
# vi: set ft=ruby :


# TODO: Variabili per provisioning, mount automatico synced_folder
# NON USARE UTENTE ROOT PER COLLEGAMENTO!

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