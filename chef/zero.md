# Using Chef Zero 

## Installing chef client

````code
wget https://packages.chef.io/files/stable/chefdk/2.5.3/el/7/chefdk-2.5.3-1.el7.x86_64.rpm /
sudo dnf install chefdk-2.5.3-1.el7.x86_64.rpm
sudo dnf install libxcrypt-compat
chef --version

````
test 

````code
chef-client -z 

#Using chef zero 

sudo chef-client -z -o myapp
````

Using vagrant with chef zero

````code
Vagrant.configure("2") do |config|
  config.vm.provision "chef_zero" do |chef|
    # Specify the local paths where Chef data is stored
    chef.cookbooks_path = "cookbooks"
    chef.data_bags_path = "data_bags"
    chef.nodes_path = "nodes"
    chef.roles_path = "roles"

    # Add a recipe
    chef.add_recipe "apache"

    # Or maybe a role
    chef.add_role "web"
  end
end
````

