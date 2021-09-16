# Install CDK Ubuntu

## prerequisites

> Install Node  14

```bash
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
```

> Install CDK Node Package

```bash
npm install -g aws-cdk
cdk --version
```

> Setup Python virtualenv

```bash
python -m ensurepip --upgrade 
python -m pip install --upgrade pip
python -m pip install --upgrade virtualenv
```

> Working with the AWS CDK in Python

```bash
mkdir my-test
cd my-test
# cdk init uses the name of the project folder to name various elements of the project, including classes, subfolders, and files.
cdk init app --language python
source .venv/bin/activate
# After activating your virtual environment, install the app's standard dependencies:
python3 -m pip install -r requirements.txt
# install requried modules
python -m pip install aws-cdk.aws-s3 aws-cdk.aws-lambda
# pip freeze to capture install modules in requirements.txt
```
> Sample bolierplate code create s3 bucket

```python
from aws_cdk import core as cdk

# For consistency with other languages, `cdk` is the preferred import name for
# the CDK's core module.  The following line also imports it as `core` for use
# with examples from the CDK Developer's Guide, which are in the process of
# being updated to use `cdk`.  You may delete this import if you don't need it.

# Import modules
from aws_cdk import core
from aws_cdk import aws_s3 as s3


class MyTestStack(cdk.Stack):

    def __init__(self, scope: cdk.Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        #The code that defines your stack goes here
        bucket = s3.Bucket(self, 
        "my-cdk-test-bucket", 
        versioned=True,)
```
> create cloudformation using cdk synth and see diff when changes are made and deploy

```bash
cdk synth
cdk diff
cdk deploy
```
> bootstrap for lambda

```bash
cdk bootstrap aws://<account>/eu-west-1
```

> destroy tear down stack
```bash
cdk destroy
# deactivate venv
deactivate
```