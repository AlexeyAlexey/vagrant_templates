module Vms
  def self.web_phoenix(config, def_name)
    current_settings = settings[def_name]
    config.vm.define def_name do |node|
      
      #web.vm.box = "generic/ubuntu1804"
      node.vm.provider :libvirt do |libvirt|
        #libvirt.id_ssh_key_file = "/home/alexey/.vagrant.d/insecure_private_key"
      end
      node.vm.hostname =  current_settings[:hostname]
      node.vm.box      = current_settings[:box_name]#"ubuntu-17.10-server-amd64-libvirt" #for elixir ubuntu version is 17  "ubuntu-18.04-server-amd64-libvirt"

      current_settings[:synced_folder]&.each{|sett| node.vm.synced_folder *sett}
      node.nfs.map_uid = 1000
      node.nfs.map_gid = 1000

      #psql -h 192.168.55.95 -U postgres   check db connection db
      network(node, current_settings)
      #current_settings[:network]&.each{|sett| node.vm.network *sett}

      # Shell
      node.vm.provision :shell, path: "scripts/git.sh"
      node.vm.provision :shell, path: "scripts/phoenix.sh"
      node.vm.provision :shell, path: "scripts/nodejs_10_x.sh"
      node.vm.provision :shell, path: "scripts/postgresql_client_9_6.sh"

      # web.vm.provision :shell, path: "scripts/install-rvm.sh",  args: ["stable"], privileged: false
      # web.vm.provision :shell, path: "scripts/install-ruby.sh", args: ["2.5", "bundler", "rails"], privileged: false
    end
    config
  end
end