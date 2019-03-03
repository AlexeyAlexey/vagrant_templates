module VmsProvision
  def self.docker(node, conf = {})
    # Shell
    node.vm.provision :shell, path: "scripts/docker.sh", args: ["18.06.0~ce~3-0~ubuntu"], privileged: true
    node.vm.provision :shell, path: "scripts/docker_compose.sh", args: ["1.22.0"], privileged: true
    node
  end 
end
