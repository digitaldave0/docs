## Get Policy Definition Name

```powershell
# Register the resource provider if it's not already registered
Register-AzResourceProvider -ProviderNamespace 'Microsoft.PolicyInsights'
```


```powershell
$mydefinition = Get-AzPolicyDefinition | where-object { $_.Properties.DisplayName -eq "Allowed locations"}
$newrg = New-AzResourceGroup -Name mytest -Location "uk west"
$newrg.ResourceGroupName = New-AzPolicyAssignment -Name "Checking Rules" -DisplayName "Checking the rules" -Scope $newrg.ResourceId -PolicyDefinition $mydefinition
#check policy state
Get-AzPolicyState -ResourceGroupName $rg.ResourceGroupName -PolicyAssignmentName 'Checking Rules' -Filter 'IsCompliant eq false'
```
```powershell
Remove-AzPolicyAssignment -Name ' -Scope '/subscriptions/<subscriptionID>/resourceGroups/<resourceGroupName>'
#example
Remove-AzPolicyAssignment -Name $mydefinition.Name -Scope $rg.ResourceId
```
