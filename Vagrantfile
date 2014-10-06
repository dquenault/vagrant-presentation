# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "nrel/CentOS-6.5-x86_64"

  config.vm.network "forwarded_port", host: 4567, guest: 8080

  config.vm.provider "virtualbox" do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.memory = 256
    vb.cpus = 1
  end
  
  config.vm.provision "file", source: "files/presentation.nginx.conf", destination: "presentation"
  config.vm.provision "file", source: "files/nginx.repo", destination: "nginx.repo"

  config.vm.provision "shell", path: "scripts/nginx.sh"
  config.vm.provision "shell", path: "scripts/nginx_copy.sh"
  config.vm.provision "shell", inline: "sudo /etc/init.d/nginx start" 

end
