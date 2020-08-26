#update allowedAudience with powershell

$PropertiesObject=@{
   "enabled"="true";
   "allowedAudience"="https://a.awtst.com", "https://b.awtst.com";
   "clientId"="<client-id>"
}
New-AzureRmResource -PropertyObject $PropertiesObject -ResourceGroupName <resource-group-name> -ResourceType Microsoft.Web/sites/config -ResourceName "<web-app-name>/authsettings" -ApiVersion 2018-02-01 -Force -Debug


#for one web app in allowedAudience

$test="https://c.awtst.com"
$ary=[string[]]$test
$ary.GetType()

$PropertiesObject2=@{
   allowedAudience=$ary
}


#https://docs.microsoft.com/en-us/cli/azure/webapp/auth?view=azure-cli-latest#az-webapp-auth-update

#arm template : use api version 2015-08-01
#https://github.com/Azure-Samples/ContosoInsurance/blob/928d991742898fb9daabc91b9328749a9dc90026/azuredeploy.json#L1054-L1086