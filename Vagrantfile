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
  
  config.vm.provision :chef_solo do |chef|
    # chef.cookbooks_path = ["~/.berkshelf/cookbooks"]
    
    # Turn on verbose Chef logging if necessary
    chef.log_level      = :debug
 
    # List the recipies you are going to work on/need.
    chef.roles_path = "roles"
    chef.data_bags_path = "data_bags"
    chef.add_recipe('chef-solo-search')
    chef.add_recipe('build-essential')
    
    #chef.add_role("ossecserver")

    
    #chef.json = {
    #	"run_list" => ["recipe[chef-solo-search]", "recipe[build-essential]", "recipe[ossec::client]" ]
    #}

  end
  
  config.vm.define :server do | server |
  	server.hostname = "ossec-server.vagrantup.com"
  	server.vm.provision :chef_solo do |chef|
  	  chef.add_recipe('ossec::server')
  	end
  end
  
  config.vm.define :client do | client |
  	client.hostname = "ossec-client.vagrantup.com"
  	client.vm.provision :chef_solo do |chef|
  	  chef.add_recipe('ossec::client')
  	end
  end
end
