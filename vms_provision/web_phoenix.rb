module VmsProvision
  def self.web_phoenix(node, config = {})
    phx_version = config[:phx_version] || "1.4.2"

    # Shell
    node.vm.provision :shell, path: "scripts/git.sh"
    node.vm.provision :shell, path: "scripts/elixir.sh"
    node.vm.provision :shell, path: "scripts/phoenix.sh", args: [phx_version], privileged: false
    node.vm.provision :shell, path: "scripts/nodejs_10_x.sh"

    node
  end
end