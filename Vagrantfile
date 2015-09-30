# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "opscode_centos-6.6_chef-provisionerless.box"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box"
  #config.vm.network "public_network", ip: "192.168.0.17"
  config.vm.host_name = "postgres01"
  config.vm.provider "postgres" do |vb|
    vb.memory = "1024"
  end
  config.vm.provision :shell, :path => "provision.sh"
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  #config.ssh.username="oracle"
  #config.ssh.insert_key=true  
end