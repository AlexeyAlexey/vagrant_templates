module Vms
  def self.web_rails(config, def_name)
    current_settings = settings[def_name]
    config.vm.define def_name do |node|
      
      #web.vm.box = "generic/ubuntu1804"
      node.vm.provider :libvirt do |libvirt|
        #libvirt.id_ssh_key_file = "/home/alexey/.vagrant.d/insecure_private_key"
      end
      node.vm.hostname = current_settings[:hostname]
      node.vm.box      = current_settings[:box_name]#"ubuntu-17.10-server-amd64-libvirt" #for elixir ubuntu version is 17  "ubuntu-18.04-server-amd64-libvirt"

      current_settings[:synced_folder]&.each{|sett| node.vm.synced_folder *sett}
      node.nfs.map_uid = 1000
      node.nfs.map_gid = 1000

      #psql -h 192.168.55.95 -U postgres   check db connection db
      network(node, current_settings)
      #current_settings[:network]&.each{|sett| node.vm.network *sett}

      #web.vm.network :private_network, autosrart: true, ip: "192.168.90.21"
      #web.vm.network :forwarded_port, guest: 3000, host: 3000

      # Shell
      node.vm.provision :shell, path: "scripts/git.sh"
      node.vm.provision :shell, path: "scripts/install-rvm.sh",  args: ["stable"], privileged: false
      #node.vm.provision :shell, path: "scripts/install-ruby.sh", args: ["2.5", "bundler", "rails"], privileged: false
      ruby_version = current_settings[:ruby_version] || "2.5"
      node.vm.provision :shell, path: "scripts/install-ruby.sh", args: [ruby_version, "bundler"], privileged: false
      node.vm.provision :shell, path: "scripts/nodejs_10_x.sh"
    end
    config
  end
end