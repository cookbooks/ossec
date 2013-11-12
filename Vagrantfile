Vagrant.configure("2") do |config|
  config.vm.box     = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"


  # Install Vagrant bershelf, Vagrant Omnibus and Vagrant cachier before running
  # vagrant plugin install vagrant-berkshelf
  # vagrant plugin install vagrant-cachier
  # vagrant plugin install vagrant-omnibus

  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.cache.auto_detect = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end
  
  config.vm.define :server do | server |
  	server.vm.hostname = "ossec-server.vagrantup.com"
  	server.vm.network "private_network", ip: "192.168.50.11"
  	server.vm.provision :chef_solo do |chef|
	  	chef.roles_path = "vagrant_data/roles"
	    chef.data_bags_path = "vagrant_data/data_bags"
	    chef.add_recipe('chef-solo-search')
	    chef.add_recipe('build-essential')
  	  chef.add_recipe('ossec::server')
  	end
  end
  
  config.vm.define :client do | client |
  	client.vm.hostname = "ossec-client.vagrantup.com"
  	client.vm.network "private_network", ip: "192.168.50.12"
  	client.vm.provision :chef_solo do |chef|
	  	chef.roles_path = "vagrant_data/roles"
	    chef.data_bags_path = "vagrant_data/data_bags"
	    chef.add_recipe('chef-solo-search')
	    chef.add_recipe('build-essential')
  	  chef.add_recipe('ossec::client')
  	end
  end
end
