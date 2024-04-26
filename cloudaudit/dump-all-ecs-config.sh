#!/bin/bash

# Get the AWS account number
account_number=$(aws sts get-caller-identity --query Account --output text)

# Create a directory with the account number
mkdir -p $account_number

# Get the list of clusters
clusters=$(aws ecs list-clusters --query 'clusterArns[]' --output text)

for cluster in $clusters
do
    echo "Processing cluster: $cluster"

    # Get the list of services for each cluster
    services=$(aws ecs list-services --cluster $cluster --query 'serviceArns[]' --output text)

    for service in $services
    do
        echo "Processing service: $service"

        # Replace slashes in the service ARN with dashes
        service_file_name=$(echo $service | tr '/' '-')

        # Describe the service configuration and save it to the account number directory
        aws ecs describe-services --cluster $cluster --services $service > "$account_number/$service_file_name.json"
    done

    # Get the list of task definitions
    task_definitions=$(aws ecs list-task-definitions --query 'taskDefinitionArns[]' --output text)

    # Get the last 50 task definitions
    last_task_definitions=$(echo $task_definitions | tr ' ' '\n' | tail -n 50)

    for task_definition in $last_task_definitions
    do
        echo "Processing task definition: $task_definition"

        # Replace slashes in the task definition ARN with dashes
        task_definition_file_name=$(echo $task_definition | tr '/' '-')

        # Describe the task definition configuration and save it to the account number directory
        aws ecs describe-task-definition --task-definition $task_definition > "$account_number/$task_definition_file_name.json"
    done
done
