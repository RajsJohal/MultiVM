# Creating a virtual machine with Linux Ubuntu 16.04
# ubuntu/xenial64

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    
    config.vm.define "app" do |app|
        app.vm.box = "ubuntu/xenial64"
        app.vm.network "private_network", ip: "192.168.10.100"
        #Sync folder from OS to VM
        app.vm.synced_folder ".", "/home/vagrant/app"

        # Provisioning
        app.vm.provision "shell", path: "./provision.sh"
    end
    config.vm.define "db" do |db|
        db.vm.box = "ubuntu/xenial64"
        db.vm.network "private_network", ip: "192.168.10.150"

        #Sync folder from OS to VM
        db.vm.synced_folder "./db", "/home/vagrant/db"

        # Provisioning
        db.vm.provision "shell", path: "./provisiondb.sh"
    end
    

end
