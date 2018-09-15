Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"

  config.vm.network :public_network

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.memory = 8192
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--monitorcount", "3"]
    vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
    vb.customize ["modifyvm", :id, "--vram", "256"]
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional'] 
  end

  # user dremy is created by ansible.  TODO: Make username configurable
  config.vm.provision "ansible_local" do |ansible|
    ansible.groups = {
      'sde' => ['default']
    }
    ansible.become = true
	  ansible.galaxy_role_file = 'provisioning/requirements.yml'
    ansible.playbook = "provisioning/playbook.yml"
  end  
  
  # set bash shell for dremy (for some reason it wasn't going to bash)
  config.vm.provision "shell", inline: "sudo usermod -s /bin/bash dremy"
  
  # run shell script as other user to setup user specific configuration
  #  This seems hackish but it will run the script in the user's home directory (-H)
  #  as the user (-u).  Note the scripts need to have unix line endings (I just edited
  #  them in unix).
  config.vm.provision "shell", inline: "sudo -H -u dremy /vagrant/scripts/setupZsh.sh"
  config.vm.provision "shell", inline: "sudo -H -u dremy /vagrant/scripts/setupdotfiles.sh"
  
end