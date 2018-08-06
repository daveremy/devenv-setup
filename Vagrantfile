Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
	vb.memory = 4096
	vb.cpus = 4
	vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
	vb.customize ["modifyvm", :id, "--vram", "256"]
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.groups = {
      'sde' => ['default']
    }
	ansible.sudo = true
	ansible.galaxy_role_file = 'provisioning/requirements.yml'
    ansible.playbook = "provisioning/playbook.yml"
  end  
  
end