# Python Notes

- Basics 
    - Python Getting Started:
    - Python Fundementals:
- Intermediate
    - Python quick start for linux Admins:
- Advanced
    - Full stack web development with python:
    - Understadning machine learning with python:

## using virtualenv with python3 ubuntu

```shell
sudo apt-get install python3-pip
sudo pip3 install virtualenv 
virtualenv venv 
virtualenv -p /usr/bin/python3.7 venv
source venv/bin/activate
#deativate 
deactivate
# also can use this with -p
virtualenv -p python3 myenv
python3 -m venv myenv
# freeze list of packages
pip3 freeze > requirements.txt
# use file to build packages
pip install -r requirements.txt
```
