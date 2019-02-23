module VmsProvision
  def self.api_phoenix(node, config = {})
    # Shell
    node.vm.provision :shell, path: "scripts/git.sh"
    node.vm.provision :shell, path: "scripts/phoenix1_4_0.sh"
    node.vm.provision :shell, path: "scripts/postgresql_client_9_6.sh"
    node
  end
end