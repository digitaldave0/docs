# Python notes

> Install Python 3.x ubuntu 

```bash
echo "installing python3"
sudo apt update 
sudo apt install curl git -y
sudo apt install python3-dev -y
sudo apt install python3-pip -y
sudo apt install python3.8-venv -y
python3 -V
```

> Using venv for python projects

```bash
# create workspace
mkdir work
vagrant@devops:~$ python3 -m venv ./work/
vagrant@devops:~$ source ./work/bin/activate
```
# deactivate workspace

```bash
deactivate
```
