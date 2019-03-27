module VmsProvision
  def self.web_rails(node, config = {})
    ruby_version = config[:ruby_version] || "2.5"
    nodejs_version = config[:nodejs_version] || "10"
    
    # Shell
    node.vm.provision :shell, path: "scripts/git.sh"
    node.vm.provision :shell, path: "scripts/install-rvm.sh",  args: ["stable"], privileged: false
    node.vm.provision :shell, path: "scripts/install-ruby.sh", args: ["2.5", "bundler", "rails"], privileged: false
    
    node.vm.provision :shell, path: "scripts/install-ruby.sh", args: [ruby_version, "bundler"], privileged: false
    node.vm.provision :shell, path: "scripts/nodejs.sh", args: [nodejs_version], privileged: false
    node
  end
end