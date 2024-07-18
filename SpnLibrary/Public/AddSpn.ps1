Function Add-Spn
{
    [CmdletBinding(
        HelpURI = 'https://github.com/mod-posh/SpnLibrary/blob/main/docs/Add-Spn.md#add-spn',
        PositionalBinding = $true
    )]
    Param
    (
        [string]$Service,
        [string]$Name,
        [string]$AccountName = $Name,
        [switch]$UserAccount,
        [switch]$NoDupes ,
        [switch]$ForestWide
    )
    Begin
    {
        if ($AccountName.IndexOfAny(".") -gt 0)
        {
            Write-Verbose "Found FQDN name, stripping down to hostname"
            $AccountName = $AccountName.Substring(0, $AccountName.IndexOfAny("."))
        }
        $DupeFound = $false
        if ($NoDupes)
        {
            $SearchFilter = "(servicePrincipalName=$($Service)/$($Name))"
            try
            {
                if ($ForestWide)
                {
                    $Forest = [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()
                    $Domains = $Forest.Domains
                }
                else
                {
                    $Domains = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
                }
                foreach ($Domain in $Domains)
                {
                    Write-Verbose "Bind to $($Domain.Name)"
                    $DirectoryEntry = $Domain.GetDirectoryEntry()
                    $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher
                    $DirectorySearcher.SearchRoot = $DirectoryEntry
                    $DirectorySearcher.PageSize = 1000
                    $DirectorySearcher.Filter = $SearchFilter
                    $DirectorySearcher.SearchScope = "Subtree"

                    Write-Verbose "Find $($AccountName)"
                    $Account = $DirectorySearcher.FindAll()

                    if ($Account.Count -gt 0)
                    {
                        Write-Host "Duplicate SPN ($($Service)/$($Name)) found for $($AccountName)"
                        $DupeFound = $true
                    }
                }
            }
            catch
            {
                Write-Error $Error[0]
                Return
            }
        }
        if (!($DupeFound))
        {
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
        }
        else
        {
            break
        }
    }
    Process
    {
        try
        {
            Write-Verbose "Connect to $($AccountName)"
            $Account = $Account.GetDirectoryEntry()
            $Spn = "$($Service)/$($Name)"
            Write-Verbose "Add SPN ($($Service)/$($Name)) to the list of existing SPNs"
            $Account.servicePrincipalName += $Spn
            $Account.CommitChanges()
        }
        catch
        {
            Write-Error $Error[0]
            Return
        }
    }
    End
    {
        foreach ($Item in $Account.servicePrincipalName)
        {
            $spn = $Item.Split("/")
            New-Object -TypeName PSobject -Property @{
                Service  = $Spn[0]
                Name     = $Spn[1]
                Hostname = $AccountName
                SPN      = $Item
            } | Select-Object -Property Service, Name, Hostname, SPN
        }
    }
}
