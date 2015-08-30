# -*- mode: ruby -*-
Vagrant.configure("2") do |config|

  config.vm.box            = "centos65-x86_64-20140116"
  config.vm.box_url        = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
  config.vm.hostname       = "vagrant-centos65"
  config.ssh.forward_agent = "true"

  #config.vm.network "private_network", ip: "192.168.50.204"
  #config.vm.network :forwarded_port, guest: 80,   host: 80    # nginx
  #config.vm.network :forwarded_port, guest: 6379, host: 6379  # redis

  config.vm.provision :shell, :inline => <<-EOH
    if [ ! -f /usr/bin/puppet ]; then
      rpm -ivh https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
      yum install -y puppet-server-3.5.1
    fi
  EOH

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "."
    puppet.module_path    = "modules"
    puppet.manifest_file  = "init.pp"
  end

end
