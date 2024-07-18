Function Get-Spn
{
    [CmdletBinding(
        HelpURI = 'https://github.com/mod-posh/SpnLibrary/blob/main/docs/Get-Spn.md#get-spn',
        PositionalBinding = $true
    )]
    Param
    (
        [string]$AccountName,
        [switch]$UserAccount
    )
    Begin
    {
        if ($AccountName.IndexOfAny(".") -gt 0)
        {
            Write-Verbose "Found FQDN name, stripping down to hostname"
            $AccountName = $AccountName.Substring(0, $AccountName.IndexOfAny("."))
        }
        if ($UserAccount)
        {
            Write-Verbose "Setting the SearchFilter to objectCategory user"
            [string]$SearchFilter = "(&(objectCategory=user)(cn=$($AccountName)))"
        }
        else
        {
            Write-Verbose "Setting the SearchFilter to objectCategory computer"
            [string]$SearchFilter = "(&(objectCategory=computer)(cn=$($AccountName)))"
        }

        try
        {
            Write-Verbose "Bind to AD"
            $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry
            $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher
            $DirectorySearcher.SearchRoot = $DirectoryEntry
            $DirectorySearcher.PageSize = 1000
            $DirectorySearcher.Filter = $SearchFilter
            $DirectorySearcher.SearchScope = "Subtree"

            Write-Verbose "Find $($AccountName)"
            $Account = $DirectorySearcher.FindOne()
        }
        catch
        {
            Write-Error $Error[0]
            Return
        }

        $SpnReport = @()
        [bool]$NotFound = $false
    }
    Process
    {
        if ($Account.Properties.Contains("servicePrincipalName"))
        {
            Write-Verbose "Found servicePrincipalName property"
            $Spns = $Account.Properties.serviceprincipalname
            foreach ($Entry in $Spns)
            {
                $Spn = $Entry.Split("/")
                $SpnItem = New-Object -TypeName PSobject -Property @{
                    Service  = $Spn[0]
                    Name     = $Spn[1]
                    Hostname = [string]$Account.Properties.samaccountname
                    SPN      = $Entry
                }
                $SpnReport += $SpnItem
            }
        }
        else
        {
            Write-Verbose "Missing servicePrincipalName property"
            $NotFound = $true
        }
    }
    End
    {
        if ($NotFound)
        {
            Write-Host "No registered ServicePrincipalNames for $($Account.Path)"
        }
        else
        {
            Return $SpnReport | Select-Object -Property Service, Name, Hostname, SPN
        }
    }
}
