
#!/bin/bash

#Bash file get all alb details#

# Get the AWS account number
account_number=$(aws sts get-caller-identity --query Account --output text)

# Create a directory with the account number
mkdir -p $account_number

# Get the list of all load balancer ARNs
lbs=$(aws elbv2 describe-load-balancers --query 'LoadBalancers[].LoadBalancerArn' --output text)

# Loop through each load balancer
for lb in $lbs
do
    # Extract the name of the load balancer from its ARN
    lb_name=$(echo $lb | cut -d'/' -f3)

    # Fetch the configuration of the load balancer
    config=$(aws elbv2 describe-load-balancers --load-balancer-arns $lb)

    # Output the configuration in table format and store it in a log file
    echo $config | jq -r '.LoadBalancers[] | {LoadBalancerName, Scheme, VpcId, Type, State}' | column -t > "$account_number/$lb_name.log"

    # Store the configuration in a JSON file
    echo $config > "$account_number/$lb_name.json"

    # Get the target groups for the load balancer
    tgs=$(aws elbv2 describe-target-groups --load-balancer-arn $lb --query 'TargetGroups[].TargetGroupArn' --output text)

    # Loop through each target group
    for tg in $tgs
    do
        # Fetch the attributes of the target group
        attrs=$(aws elbv2 describe-target-group-attributes --target-group-arn $tg)

        # Append the attributes to the log file
        echo $attrs | jq -r '.Attributes[] | {Key, Value}' | column -t >> "$account_number/$lb_name.log"

        # Append the attributes to the JSON file
        echo $attrs >> "$account_number/$lb_name.json"
    done

    # Get the listener ARNs for the load balancer
    listeners=$(aws elbv2 describe-listeners --load-balancer-arn $lb --query 'Listeners[].ListenerArn' --output text)

    # Loop through each listener
    for listener in $listeners
    do
        # Fetch the rules of the listener
        rules=$(aws elbv2 describe-rules --listener-arn $listener)

        # Append the rules to the JSON file
        echo $rules >> "$account_number/$lb_name.json"
    done
done
