# user editable here

if !ENV['vagrant_ossec_clients']
  number_of_clients = 1
else
  number_of_clients = ENV['vagrant_ossec_clients']
end
if !ENV['vagrant_private_network']
  private_network = "192.168.50.10"
else
  private_network = ENV['vagrant_private_network']
end

agents = Array.new
subnets = private_network.split('.')
(1..number_of_clients).each do |i|
  server = Hash.new
  server['vagrantname'] = "client#{i}"
  server['hostname'] = "ossec-client#{i}.vagrantup.com"
  subnets[3] = subnets[3].to_i + 1
  server['ipaddress'] = subnets.join('.')
  agents << server
end

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
    server.vm.network "private_network", ip: private_network
    server.vm.provision "shell",
    inline: "apt-get update"
    server.vm.provision :chef_solo do |chef|
      chef.roles_path = "vagrant_data/roles"
      chef.data_bags_path = "vagrant_data/data_bags"
      chef.json = {"ossec" => { "user" => { "agents" => agents } } }
      chef.add_recipe('chef-solo-search')
      chef.add_recipe('build-essential')
      chef.add_recipe('ossec::server')
    end
  end

  agents.each do |agent|
    config.vm.define agent['vagrantname'] do | client |
      client.vm.hostname = agent['hostname']
      client.vm.network "private_network", ip: agent['ipaddress']
      client.vm.provision "shell",
      inline: "apt-get update"
      client.vm.provision :chef_solo do |chef|
        chef.roles_path = "vagrant_data/roles"
        chef.data_bags_path = "vagrant_data/data_bags"
        chef.json = { "ossec" => { "user" => { "agent_server_ip" => private_network } } }
        chef.add_recipe('chef-solo-search')
        chef.add_recipe('build-essential')
        chef.add_recipe('ossec::client')
      end
    end
  end
end
