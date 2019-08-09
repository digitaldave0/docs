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
````
