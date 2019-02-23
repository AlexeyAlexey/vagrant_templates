module VmsProvision
  def self.git(node, config = {})
    # Shell
    node.vm.provision :shell, path: "scripts/git.sh"
    node
  end
end