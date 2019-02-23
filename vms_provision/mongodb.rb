module VmsProvision
  def self.mongodb(node, conf = {})
    # Shell
    node.vm.provision :shell, path: "scripts/mongodb.sh", args: ["4.0", "4.0.0", "xenial"], privileged: true
    #db.vm.provision :shell, path: "scripts/mongodb_shell.sh", args: ["4.0", "4.0.0", "xenial"], privileged: true
    node
  end	
end
