#!/bin/bash

# Create output directory if it doesn't exist
mkdir -p output

# Function to get policies for a given identity type and name
get_policies() {
    local identity_type=$1
    local identity_name=$2

    # Determine the appropriate AWS CLI command based on the identity type
    local list_command
    case $identity_type in
        user) list_command="list-attached-user-policies";;
        role) list_command="list-attached-role-policies";;
        group) list_command="list-attached-group-policies";;
    esac

    # List the policies attached to the identity
    for arn in $(aws iam $list_command --${identity_type}-name $identity_name --query 'AttachedPolicies[].PolicyArn' --output text)
    do
        # Extract the policy name from the ARN
        policy_name=$(echo $arn | awk -F/ '{print $NF}')

        # Get the policy versions
        versions=$(aws iam list-policy-versions --policy-arn $arn --query 'Versions[].VersionId' --output text)

        # Find the latest version (assuming the versions are in the format vN where N is a number)
        latest_version=$(echo $versions | tr ' ' '\n' | sort -V | tail -n 1)

        # Get the policy document for the latest version
        aws iam get-policy-version --policy-arn $arn --version-id $latest_version --query 'PolicyVersion.Document' --output json > output/$policy_name.json
    done
}

# List all IAM users
for user in $(aws iam list-users --query 'Users[].UserName' --output text)
do
    get_policies user $user
done

# List all IAM roles
for role in $(aws iam list-roles --query 'Roles[].RoleName' --output text)
do
    get_policies role $role
done

# List all IAM groups
for group in $(aws iam list-groups --query 'Groups[].GroupName' --output text)
do
    get_policies group $group
done
