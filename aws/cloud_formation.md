
### create ec2 instance from template.yml

> aws cloudformation deploy --template-file template.yml --stack-name my-ec2-instance --debug

### validate can also use cfn-lint

> aws cloudformation validate-template --template-body file://template.yml

### update stack with changes added EBS vol

> aws cloudformation update-stack --stack-name my-ec2-instance --template-body file://template.yml

### check running stack

> aws cloudformation describe-stack-events --stack-name my-ec2-instance

### delete stack and resources

> aws cloudformation delete-stack --stack-name my-ec2-instance --debug

### get stack template

> aws cloudformation get-template --stack-name my-ec2-instance


