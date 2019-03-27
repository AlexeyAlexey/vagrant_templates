module VmsProvision
  def self.api_phoenix(node, config = {})
    # Shell
    phx_version = config[:phx_version] || "1.4.2"

    node.vm.provision :shell, path: "scripts/git.sh"
    node.vm.provision :shell, path: "scripts/elixir.sh"
    node.vm.provision :shell, path: "scripts/phoenix.sh", args: [phx_version], privileged: false
    node
  end
end