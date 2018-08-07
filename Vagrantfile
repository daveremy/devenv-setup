Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
	vb.memory = 4096
	vb.cpus = 4
	vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
	vb.customize ["modifyvm", :id, "--vram", "256"]
  end

  # Install Git, Node.js 6.x.x, Latest npm
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    # curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    # apt-get install -y nodejs
    # apt-get install -y build-essential
    # npm install -g npm
    # apt-get update
    # apt-get upgrade -y
    # apt-get autoremove -y
  SHELL

  config.vm.provision "ansible_local" do |ansible|
    ansible.groups = {
      'sde' => ['default']
    }
	ansible.sudo = true
	ansible.galaxy_role_file = 'provisioning/requirements.yml'
    ansible.playbook = "provisioning/playbook.yml"
  end  
  
end