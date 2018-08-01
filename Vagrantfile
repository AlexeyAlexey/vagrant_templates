# -*- mode: ruby -*-
# vi: set ft=ruby :

Dir.glob("#{File.dirname(__FILE__)}/vms/*.rb") { |file|  require file }
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vms.settings = {"phoenix_chat_service" => {hostname: "phoenixChatService",
                                           network: [ [:private_network, {autosrart: true, ip: "192.168.90.95"}],
                                                      [:forwarded_port, {guest: 4005, host: 4005}] 
                                                    ]
                                          },
                "rails_social" =>         {hostname: "railsSocial",
                                           network: [ [:private_network, {autosrart: true, ip: "192.168.90.96"}],
                                                      [:forwarded_port, {guest: 3000, host: 3000}]
                                                    ]
                                          },
                "phoenix_postgresql" =>  {hostname: "phoenixPostgresql",
                                          network: [ [:private_network, {autosrart: true, ip: "192.168.90.80"}] ]
                                          },
                "rails_postgresql" =>    {hostname: "railsPostgresql",
                                          network: [ [:private_network, {autosrart: true, ip: "192.168.90.81"}] ]
                                         },
                "phoenix_mongodb"  =>    {hostname: "phoenixMongodb",
                                          network: [ [:private_network, {autosrart: true, ip: "192.168.90.82"}] ]
                                         },
                "docker" =>              {hostname: "docker"}
}

Vms.settings = {"phoenix_chat_service" => {synced_folder: [ ["./web_phoenix", "/vagrant", type: "nfs"] ] },                                           
                "rails_social"         => {synced_folder: [ ["./web_rails",   "/vagrant", type: "nfs"] ] },
                "phoenix_postgresql"   => {synced_folder: [ ["./postgresql",  "/vagrant", type: "nfs"] ] },
                "rails_postgresql"     => {synced_folder: [ ["./postgresql",  "/vagrant", type: "nfs"] ] },
                "phoenix_mongodb"      => {synced_folder: [ ["./mongodb",     "/vagrant", type: "nfs"] ] }
}


#vagrant global-status
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.

  Vms.web_phoenix(config, "phoenix_chat_service")

  Vms.web_rails(config, "rails_social")
  
  Vms.postgresql_9_6(config, "phoenix_postgresql")
  Vms.postgresql_9_6(config, "rails_postgresql")

  Vms.mongodb(config, "phoenix_mongodb")

  Vms.docker(config, "docker")
  

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
