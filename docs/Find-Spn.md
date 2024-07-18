---
external help file: SpnLibrary-help.xml
Module Name: SpnLibrary
online version: https://github.com/mod-posh/SpnLibrary/blob/main/docs/Find-Spn.md#find-spn
schema: 2.0.0
---

# Find-Spn

## SYNOPSIS

Find all occurrences of a given service and or name

## SYNTAX

```powershell
Find-Spn [[-Service] <String>] [[-Name] <String>] [-ForestWide] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION

To find a list of the SPNs that a computer has registered with
Active Directory from a command prompt, use the setspn -Q hostname
command, where hostname is the actual host name of the computer
object that you want to query.

For example, to list the SPNs of a computer named WS2003A, at the
command prompt, type setspn -Q WS2003A, and then press ENTER.

## EXAMPLES

### EXAMPLE 1

```powershell
Find-Spn -Service goo

Service           Name                  Hostname   SPN
-------           ----                  --------   ---
goo               server-01             server-01$ goo/server-01
HOST              server-01             server-01$ HOST/server-01
HOST              server-01.company.com server-01$ HOST/server-01.company.com
RestrictedKrbHost server-01.company.com server-01$ RestrictedKrbHost/server-01.company.com
RestrictedKrbHost server-01             server-01$ RestrictedKrbHost/server-01
WSMAN             server-01.company.com server-01$ WSMAN/server-01.company.com
WSMAN             server-01             server-01$ WSMAN/server-01
TERMSRV           server-01.company.com server-01$ TERMSRV/server-01.company.com
TERMSRV           server-01             server-01$ TERMSRV/server-01
CmRcService       server-01             server-01$ CmRcService/server-01
CmRcService       server-01.company.com server-01$ CmRcService/server-01.company.com
```

Find all occurrences of the given service

### EXAMPLE 2

```powershell
Find-Spn -Name server-01

Service           Name                  Hostname   SPN
-------           ----                  --------   ---
goo               server-01             server-01$ goo/server-01
HOST              server-01             server-01$ HOST/server-01
HOST              server-01.company.com server-01$ HOST/server-01.company.com
RestrictedKrbHost server-01.company.com server-01$ RestrictedKrbHost/server-01.company.com
RestrictedKrbHost server-01             server-01$ RestrictedKrbHost/server-01
WSMAN             server-01.company.com server-01$ WSMAN/server-01.company.com
WSMAN             server-01             server-01$ WSMAN/server-01
TERMSRV           server-01.company.com server-01$ TERMSRV/server-01.company.com
TERMSRV           server-01             server-01$ TERMSRV/server-01
CmRcService       server-01             server-01$ CmRcService/server-01
CmRcService       server-01.company.com server-01$ CmRcService/server-01.company.com
```

Find all occurrences of the given name

## PARAMETERS

### -ForestWide

A switch to check for duplicate SPN's across the entire forest

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name

The name that will be associated with this service on this account

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Service

The name of the service to find

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

FunctionName : Find-Spn
Created by   : jspatton
Date Coded   : 07/10/2013 15:07:12

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/SpnLibrary#Find-Spn](https://code.google.com/p/mod-posh/wiki/SpnLibrary#Find-Spn)

[http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx](http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx)
