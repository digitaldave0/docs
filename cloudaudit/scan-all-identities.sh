#!/bin/bash

# Create the outputs directory if it doesn't exist
mkdir -p outputs

# List all IAM policies
aws iam list-policies --output table | tee outputs/policies.log

# List all IAM roles
aws iam list-roles --output table | tee outputs/roles.log

# List all IAM users
aws iam list-users --output table | tee outputs/users.log

# Get the account ID
account_id=$(aws sts get-caller-identity --query Account --output text)

# Loop through each policy and store details in a separate log file if it has attachments
for policy in $(aws iam list-policies --query 'Policies[?AttachmentCount>`0`].PolicyName' --output text)
do
    aws iam get-policy --policy-arn arn:aws:iam::$account_id:policy/$policy --output table | tee outputs/$policy.log
done

# Loop through each role and list attached policies
for role in $(aws iam list-roles --query 'Roles[].RoleName' --output text)
do
    echo "Role: $role" | tee -a outputs/role_policies.log
    aws iam list-attached-role-policies --role-name $role --output table | tee -a outputs/role_policies.log
done
