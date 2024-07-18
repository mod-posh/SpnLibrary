Function Remove-Spn
{
    [CmdletBinding(
        HelpURI = 'https://github.com/mod-posh/SpnLibrary/blob/main/docs/Remove-Spn.md#remove-spn',
        PositionalBinding = $true
    )]
    Param
    (
        [string]$Service,
        [string]$Name,
        [string]$AccountName = $Name,
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
        [bool]$NotFound = $false
    }
    Process
    {
        if ($Account.Properties.Contains("servicePrincipalName"))
        {
            try
            {
                $Account = $Account.GetDirectoryEntry()
                $Account.servicePrincipalName.Remove("$($Service)/$($Name)")
                $Account.CommitChanges()
            }
            catch
            {
                Write-Error $Error[0]
                Return
            }
        }
        else
        {
            $NotFound = $true
        }
    }
    End
    {
        if ($NotFound)
        {
            Write-Host "No SPN found for $($AccountName)"
        }
        else
        {
            $SpnReport = @()
            foreach ($Item in $Account.servicePrincipalName)
            {
                $spn = $Item.Split("/")
                $SpnItem = New-Object -TypeName PSobject -Property @{
                    Service  = $Spn[0]
                    Name     = $Spn[1]
                    Hostname = $AccountName
                    SPN      = $Item
                }
                $SpnReport += $SpnItem
            }
            Return $SpnReport | Select-Object -Property Service, Name, Hostname, SPN
        }
    }
}
