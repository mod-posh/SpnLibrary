Function Find-DuplicateSpn
{
    [CmdletBinding(
        HelpURI = 'https://github.com/mod-posh/SpnLibrary/blob/main/docs/Find-DuplicateSpn.md#find-duplicatespn',
        PositionalBinding = $true
    )]
    Param
    (
        [switch]$ForestWide
    )
    Begin
    {
        try
        {
            $ErrorActionPreference = 'Stop'
            $Binary = 'setspn.exe'
            $Type = 'Leaf'
            [string[]]$paths = @($pwd);
            $paths += "$pwd;$env:path".split(";")
            $paths = Join-Path $paths $(Split-Path $Binary -leaf) | ? { Test-Path $_ -Type $type }
            if ($paths.Length -gt 0)
            {
                $SpnPath = $paths[0]
            }
        }
        catch
        {
            $Error[0]
        }
    }
    Process
    {
        try
        {
            $ErrorActionPreference = 'Stop'
            if ($ForestWide)
            {
                Invoke-Expression "$($SpnPath) -X -P -F"
            }
            else
            {
                Invoke-Expression "$($SpnPath) -X -P"
            }
        }
        catch
        {
            Write-Error $Error[0]
        }
    }
    End
    {
    }
}
