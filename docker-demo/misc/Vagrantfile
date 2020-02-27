Vagrant.configure(2) do |config|
  config.vm.define "docker" do |docker|
    docker.vm.box = "ubuntu/trusty64"
    docker.vm.network "private_network", ip: "192.168.0.249"
    docker.vm.hostname = "docker.example.com"
  end
end
