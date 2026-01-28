$adminUrl = "https://contoso-admin.sharepoint.com" 
Connect-SPOService -Url $adminUrl

$path = websites.csv
$websites = Import-Csv -Path $path

