# Multi Machine Task
## Multi Machine
Vagrant can define and control multiple guest machines per Vagrantfile, this is known as multi-machine environment

**Vagrant File config**
```
Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"

    config.vm.define "app" do |app|
        app.vm.box = "ubuntu/xenial64"
        app.vm.network "private_network", ip: "192.168.10.100"
    end
    config.vm.define "db" do |db|
        db.vm.box = "ubuntu/xenial64"
        db.vm.network "private_network", ip: "192.168.10.150"
    end
end
```
- Defined 2 VM's one called app and the other called db
- Allocated IP's to both VM's
- app 192.168.10.100
- db 192.168.10.150
- Both VM's run at the same time and displays on VirtualBox

**MongoDB**
 - Installed MongoDB on the db VM
 - `systemctl status mongodb` outputted the message below:
```
● mongod.service - MongoDB Database Server
   Loaded: loaded (/lib/systemd/system/mongod.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2021-11-30 17:15:24 UTC; 7min ago
     Docs: https://docs.mongodb.org/manual
 Main PID: 2908 (mongod)
   CGroup: /system.slice/mongod.service
           └─2908 /usr/bin/mongod --config /etc/mongod.conf

Nov 30 17:15:24 ubuntu-xenial systemd[1]: Started MongoDB Database Server.

```
**Persistent Env Var**
- `nano ~/.bash_profile`
- Created the env var DB_HOME=192.168.10.150:27017
- Saved changes 
- `source ~/.bash_profile`
- `printenv DB_HOST` returned 192.168.10.150:27017

**Automation**
- Automate provisioning of MultiVM env with app, db and Reverse Proxy.
- To automate the reverse proxy, replace the current default folder with a new defined default file with the correct local host port number. 

- `rm -rf /etc/nginx/sites-available/default`
- `sudo cp default /etc/nginx/sites-available/default`

- Same principle with mongod.conf, replace curret file with a new mongod.conf file with the correct bindIP.

- ` rm -rf /etc/mongod.conf`
- `cp mongod.conf /etc/mongod.conf`
































