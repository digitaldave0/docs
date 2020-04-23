
Basic AWS Client Notes

## Create and Manage EC2 Instances

### Create KeyPair

> aws ec2 create-key-pair --key-name UbuntuServerKeyPair --query 'KeyMaterial' --output text > .ssh/UbuntuServerKeyPair.pem

### Create EC2 Instance 
> aws ec2 run-instances --image-id  ami-006a0174c6c25ac06 --count 1 --instance-type t2.micro --key-name UbuntuServerKeyPair --security-group-ids sg-c37081a1 --subnet-id subnet-f186138b  --tag-specifications 'ResourceType=instance,Tags=[{Key=name,Value=ubuntu-server}]'

## Try above again with count of three

> aws ec2 run-instances --image-id  ami-006a0174c6c25ac06 --count 3 --instance-type t2.micro --key-name UbuntuServerKeyPair --security-group-ids sg-c37081a1 --subnet-id subnet-f186138b  --tag-specifications 'ResourceType=instance,Tags=[{Key=name,Value=ubuntu-server}]'


### Add 10gb ebs volume

> aws ec2 run-instances --image-id  ami-006a0174c6c25ac06 --count 1 --instance-type t2.micro --key-name UbuntuServerKeyPair --security-group-ids sg-c37081a1 --subnet-id subnet-f186138b --block-device-mappings "[{\"DeviceName\":\"/dev/sdf\",\"Ebs\":{\"VolumeSize\":10,\"DeleteOnTermination\":false}}]" --tag-specifications 'ResourceType=instance,Tags=[{Key=name,Value=ubuntu-server}]'

### List running Instances

> aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"

### Tag it with name.

> aws ec2 create-tags --resources i-05e87b7d40351c73a --tags Key=Name,Value=testserver

### Terminate with id

> aws ec2 terminate-instances --instance-ids i-05e87b7d40351c73a

### SSH to Instance

> ssh -i "UbuntuServerKeyPair.pem " <instance_name>
