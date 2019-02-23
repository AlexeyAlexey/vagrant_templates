module VmsProvision
  def self.postgresql_9_6(node, conf = {})
    # Shell
    node.vm.provision :shell, path: "scripts/postgresql_9_6.sh"
    node
  end
end