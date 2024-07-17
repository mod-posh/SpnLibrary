Function Reset-Spn
{
    [CmdletBinding(
        HelpURI = 'https://github.com/mod-posh/SpnLibrary/blob/main/docs/Reset-Spn.md#reset-spn',
        PositionalBinding = $true
    )]
    Param
    (
        [string]$AccountName
    )
    Begin
    {
        if ($AccountName.IndexOfAny(".") -gt 0)
        {
            Write-Verbose "Found FQDN name, stripping down to hostname"
            $AccountName = $AccountName.Substring(0, $AccountName.IndexOfAny("."))
        }
        try
        {
            Write-Verbose "Bind to AD"
            [string]$SearchFilter = "(&(objectCategory=computer)(cn=$($AccountName)))"
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
    Process
    {
        try
        {
            $Account = $Account.GetDirectoryEntry()
            $HostSpns = $Account.servicePrincipalName | Where-Object { $_ -like "host/$($AccountName)*" }
            if ($HostSpns.Count -ne 2)
            {
                Write-Verbose "Host SPN count is $($HostSpns.Count)"
                foreach ($HostSpn in $HostSpns)
                {
                    Write-Verbose "Removing $($HostSpn)"
                    $Account.servicePrincipalName.Remove($HostSpn)
                }
                Write-Verbose "Adding HOST/$($AccountName)"
                $Account.servicePrincipalName += "HOST/$($AccountName)"
                Write-Verbose "Adding HOST/$($Account.dNSHostName)"
                $Account.servicePrincipalName += "HOST/$($Account.dNSHostName)"
                $Account.CommitChanges()
            }
            else
            {
                Return "Nothing to do"
            }
        }
        catch
        {
            Write-Error $Error[0]
            Return
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
                Hostname = $AccountName
                SPN      = $Item
            }
            $SpnReport += $SpnItem
        }
        Return $SpnReport | Select-Object -Property Service, Name, Hostname, SPN
    }
}
