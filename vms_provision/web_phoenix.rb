module VmsProvision
  def self.web_phoenix(node, config = {})
      # Shell
    node.vm.provision :shell, path: "scripts/git.sh"
    node.vm.provision :shell, path: "scripts/phoenix1_4_0.sh"
    node.vm.provision :shell, path: "scripts/nodejs_10_x.sh"

    node
  end
end