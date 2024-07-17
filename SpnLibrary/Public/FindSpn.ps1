Function Find-Spn
{
    [CmdletBinding(
        HelpURI = 'https://github.com/mod-posh/SpnLibrary/blob/main/docs/Find-Spn.md#find-spn',
        PositionalBinding = $true
    )]
    Param
    (
        [string]$Service,
        [string]$Name,
        [switch]$ForestWide
    )
    Begin
    {
        if (!($Service))
        {
            $Service = "*"
        }
        if (!($Name))
        {
            $Name = "*"
        }
        if ("$($Service)/$($Name))" -eq "*/*")
        {
            Write-Error "You will need to enter a value for either Service or Name"
            Return
        }
    }
    Process
    {
        $SearchFilter = "(servicePrincipalName=$($Service)/$($Name))"
        Write-Verbose $SearchFilter
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
                Write-Verbose $Domains.Name
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
                Write-Verbose $Account.Count
            }
        }
        catch
        {
            Write-Error $Error[0]
            Return
        }
        if ($Account.Count -gt 0)
        {
            $Account = $Account.GetDirectoryEntry()
            Write-Verbose "Existing SPN ($($Service)/$($Name)) found for $($Account.Properties.samaccountname)"
        }
    }
    End
    {
        $SpnReport = @()
        foreach ($Item in $Account.servicePrincipalName)
        {
            $spn = $Item.Split("/")
            $SpnItem = New-Object -TypeName PSobject -Property @{
                Service  = $Spn[0]
                Name     = $Spn[1]
                Hostname = [string]($Account.samAccountName)
                SPN      = $Item
            }
            $SpnReport += $SpnItem
        }
        Return $SpnReport | Select-Object -Property Service, Name, Hostname, SPN
    }
}
