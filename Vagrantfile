Vagrant.configure(2) do |config|

  config.ssh.forward_agent = 'true'

  config.vm.box = "ebrc/centos-7.1-64-nocm"
  config.vm.box_url = 'http://software.apidb.org/vagrant/centos-7.1-64-nocm.json'
 
  config.vm.hostname = 'redmine.vm.apidb.org'
  config.vm.network :private_network, type: 'dhcp'

  if Vagrant.has_plugin?('landrush')
    config.landrush.enabled = true
    config.landrush.tld = 'vm.apidb.org'
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'playbook.yml'
  end

end
