Vagrant.configure(2) do |config|

  config.ssh.forward_agent = 'true'

  config.vm.box_url = 'http://software.apidb.org/vagrant/centos-7-64-puppet.json'
  config.vm.box = 'ebrc/centos-7-64-puppet'

  config.vm.hostname = 'redmine.vm.apidb.org'
  config.vm.network :private_network, type: 'dhcp'

  if Vagrant.has_plugin?('landrush')
    config.landrush.enabled = true
    config.landrush.tld = 'vm.apidb.org'
  end

  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
  end

#  config.vm.provision 'bootstrap', type: 'ansible' do |ansible|
#    ansible.playbook = 'bootstrap.yml'
#  end

  config.vm.provision 'deploy', type: 'ansible' do |ansible|
    ansible.playbook = 'vagrant-playbook.yml'
    ansible.galaxy_role_file = 'requirements.yml'
    ansible.galaxy_roles_path = 'roles'
  end

end
