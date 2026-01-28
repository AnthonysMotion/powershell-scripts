$adminUrl = "https://contoso-admin.sharepoint.com"
Connect-SPOService -Url $adminUrl

$path = "websites.csv"
$websites = Import-Csv -Path $path

foreach ($website in $websites) {

    Write-Host $website.Title

    try {
        Get-SPOSite -Identity $website.URL -ErrorAction Stop | Out-Null
        Write-Host "$($website.Title) already exists."
        continue
    }
    catch {
        Write-Host "$($website.Title) does not exist."
    }

    New-SPOSite `
        -Url $website.URL `
        -Owner $website.Owner `
        -StorageQuota $website.StorageQuota `
        -Title $website.Title `
        -Template $website.Template

    Write-Host "$($website.Title) created successfully."
}
