# -*- mode: ruby -*-
# # vi: set ft=ruby :

require 'fileutils'
require 'open-uri'
require 'tempfile'
require 'yaml'

Vagrant.require_version ">= 1.6.0"

$cpu_count = 2
$vm_memory = 4096

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "xenial-box"
  config.vm.network "public_network",
    use_dhcp_assigned_default_route: true

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    # vb.name = ubuntu
    vb.customize [
      "modifyvm", :id,
      "--cpuexecutioncap", "50",
    ]
    vb.memory = $vm_memory
    vb.cpus = $cpu_count
  end

  config.vm.provision "shell", path: "provision/setup.sh"
  config.vm.provision "shell", path: "provision/validate.sh"
  config.vm.provision "shell", path: "provision/git_repo.sh"
  config.vm.provision "shell", path: "provision/container_bootup.sh"
end
