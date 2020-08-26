
#update virtual directories and applications with powershell

#1.generate json file
#(1)echo
echo -n '{
   "virtualApplications":[
       {
           "physicalPath":"site\\wwwroot",
           "preloadEnabled":"true",
           "virtualDirectories":[
              {
                 "physicalPath":"site\\wwwroot\\6776",
                 "virtualPath":"/6776"
              }
           ],
           "virtualPath":"/"
       },
       {  
           "physicalPath":"site\\12345",
           "preloadEnabled":"false",
           "virtualPath":"/12345"
       }
   ]
}' > 1234.json


#(2)hastables
$var4=@{
   virtualApplications=@(
   @{
      physicalPath="site\wwwroot"
      preloadEnabled=$true
      virtualPath="/"
      virtualDirectories=@(
         @{
         physicalPath= "site\wwwroot\6776"
         virtualPath="/6776"
         }
      )
    },   
   @{
       physicalPath="site\int98"
       preloadEnabled=$false
       virtualPath="/int98"
    }
)
}


$result3=$var4 | ConvertTo-Json -Depth 5
$result3 >5678.json


#2. update
az resource update --name <web-app-name> --resource-group <resource-group-name> --resource-type "Microsoft.Web/sites" --set properties.siteConfig=@5678.json --debug
#or
az webapp config set -g <resource-group-name> -n <web-app-name> --generic-configurations '@5678.json' --verbose




#3. user another api.
echo -n '[
       {
           "physicalPath":"site\\wwwroot",
           "preloadEnabled":"true",
           "virtualDirectories":[
              {
                 "physicalPath":"site\\wwwroot\\6776",
                 "virtualPath":"/6776"
              }
           ],
           "virtualPath":"/"
       },
       {  
           "physicalPath":"site\\12345",
           "preloadEnabled":"false",
           "virtualPath":"/12345"
       }
   ]' > 91011.json


az resource update --name "<web-app-name>/config/web" --resource-group <resource-group-name> --resource-type "Microsoft.Web/sites/config" --set properties.virtualApplications=$91011.json --debug

