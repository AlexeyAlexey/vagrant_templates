module VmsProvision
  def self.web_rails(node, config = {})
    # Shell
    node.vm.provision :shell, path: "scripts/git.sh"
    node.vm.provision :shell, path: "scripts/install-rvm.sh",  args: ["stable"], privileged: false
    #node.vm.provision :shell, path: "scripts/install-ruby.sh", args: ["2.5", "bundler", "rails"], privileged: false
    ruby_version = current_settings[:ruby_version] || "2.5"
    node.vm.provision :shell, path: "scripts/install-ruby.sh", args: [ruby_version, "bundler"], privileged: false
    node.vm.provision :shell, path: "scripts/nodejs_10_x.sh"
    node
  end
end