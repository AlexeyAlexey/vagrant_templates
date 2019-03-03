module VmsProvision
  def self.install_rvm(node, config = {})
    # Shell
    node.vm.provision :shell, path: "scripts/install-rvm.sh",  args: ["stable"], privileged: false
    node
  end
end