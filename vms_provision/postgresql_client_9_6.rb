module VmsProvision
  def self.postgresql_client_9_6(node, config = {})
    # Shell
    node.vm.provision :shell, path: "scripts/postgresql_client_9_6.sh"

    node
  end
end