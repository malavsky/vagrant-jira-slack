    # -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
vagrantRoot = File.dirname(__FILE__)
configValues = YAML.load_file(vagrantRoot + "/configs/config.yml") 
vmData = configValues['vm']
gitData = configValues['git']

Vagrant::configure("2") do |config|

 config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", "#{vmData['memory']}",
      "--cpus", "#{vmData['cpus']}",
      "--ioapic", "#{vmData['ioapic']}"
      ]
    end

  config.vm.box = "#{vmData['box']}"

  config.vm.hostname = "#{vmData['host_name']}"
  config.vm.synced_folder "#{vmData['synced_folder_from']}", "#{vmData['synced_folder_to']}", type: "#{vmData['synced_folder_type']}"

  config.vm.network :private_network, ip: "#{vmData['network_ip']}"

  config.vm.provision :shell, path: "shell/start.sh"
  config.vm.provision :shell, path: "shell/nginx.sh", args: ["#{vmData['host_name']}", "#{vmData['synced_folder_to']}"]
  config.vm.provision :shell, path: "shell/clone.sh", args: ["#{vmData['synced_folder_to']}", "#{gitData['ssh_url']}", "#{gitData['http_url']}", "#{gitData['http_user']}", "#{gitData['http_password']}"]
  config.vm.provision :shell, path: "shell/project.sh", args: ["#{vmData['synced_folder_to']}"]

end
