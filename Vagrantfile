Vagrant.configure(2) do |config|

  config.ssh.forward_agent = 'true'

  config.vm.box = "ebrc/centos-7-64-puppet"
 
  config.vm.hostname = 'redmine.vm.apidb.org'
  config.vm.network :private_network, type: 'dhcp'

  if Vagrant.has_plugin?('landrush')
    config.landrush.enabled = true
    config.landrush.tld = 'vm.apidb.org'
  end

#  config.vm.provision 'bootstrap', type: 'ansible' do |ansible|
#    ansible.playbook = 'bootstrap.yml'
#  end

  config.vm.provision 'deploy', type: 'ansible' do |ansible|
    ansible.playbook = 'playbook.yml'
  end

end
