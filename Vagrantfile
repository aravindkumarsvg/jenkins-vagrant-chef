# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Sets the box name
  config.vm.box = "ubuntu/trusty64"
  # Disables box update
  config.vm.box_check_update = false
  # Sets the host only IP
  config.vm.network "private_network", ip: "192.168.33.19"
  # Virtualbox provider specific configurations
  config.vm.provider "virtualbox" do |vb|
    # Sets the Machine name
    vb.name = "jenkins_machine"
    # Sets the memory of the machine to 512 MB
    vb.memory = "1024"
  end
  config.omnibus.chef_version = '12.10.24'
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = "scripts/cookbooks/jenkins_local/Berksfile"
  # Sets the provisioner to Chef Solo
  config.vm.provision 'chef_solo' do |chef|
		chef.run_list = [
			'recipe[jenkins_local::default]'
		]
		
  end
end
