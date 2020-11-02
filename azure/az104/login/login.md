## Login

### Install install Azure CLI Tools

````bash

````

## Show Container Output

````bash

az container show \
  --resource-group bd0c9c69-ff25-48e3-b029-0e303c0c9a04 \
  --name mycontainer \
  --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" \
  --out table
````

## Create Container with Restart Policy

>With a configurable restart policy, you can specify that your containers are stopped when their processes have completed. Because container instances are billed by the second, you're charged only for the compute resources used while the container executing your task is running.

|  Restart policy |  Description |   | 
|---|---|---|---|---|
| Allways   | Containers in the container group are always restarted. This policy makes sense for long-running tasks such as a web server. This is the default setting applied when no restart policy is specified at container creation.  |   |   |   |
| Never  | Containers in the container group are never restarted. The containers run one time only. |    |   |   |
| OnFailure	 | Containers in the container group are restarted only when the process executed in the container fails (when it terminates with a nonzero exit code). The containers are run at least once. This policy works well for containers that run short-lived tasks  |   |   |   |

````bash
az container create \
  --resource-group bd0c9c69-ff25-48e3-b029-0e303c0c9a04 \
  --name mycontainer-restart-demo \
  --image microsoft/aci-wordcount:latest \
  --restart-policy OnFailure \
  --location eastus
````
