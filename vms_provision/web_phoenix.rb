module VmsProvision
  def self.web_phoenix(node, config = {})
    phx_version = config[:phx_version] || "1.4.2"
    nodejs_version = config[:nodejs_version] || "10"

    # Shell
    node.vm.provision :shell, path: "scripts/git.sh"
    node.vm.provision :shell, path: "scripts/elixir.sh"
    node.vm.provision :shell, path: "scripts/phoenix.sh", args: [phx_version], privileged: false
    node.vm.provision :shell, path: "scripts/nodejs.sh", args: [nodejs_version], privileged: false

    node
  end
end