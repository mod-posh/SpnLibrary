---
external help file: SpnLibrary-help.xml
Module Name: SpnLibrary
online version: https://github.com/mod-posh/SpnLibrary/blob/main/docs/Get-Spn.md#get-spn
schema: 2.0.0
---

# Get-Spn

## SYNOPSIS

List Service Principal Name for an account

## SYNTAX

```powershell
Get-Spn [[-AccountName] <String>] [-UserAccount] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

To view a list of the SPNs that a computer has registered with
Active Directory from a command prompt, use the setspn -l hostname
command, where hostname is the actual host name of the computer
object that you want to query.

For example, to list the SPNs of a computer named WS2003A, at the
command prompt, type setspn -l S2003A, and then press ENTER.

## EXAMPLES

### EXAMPLE 1

```powershell
Get-Spn -AccountName cm12-test
```

Service           Name                  Hostname   SPN
-------           ----                  --------   ---
CmRcService       SERVER-01.company.com SERVER-01$ CmRcService/SERVER-01.company.com
CmRcService       SERVER-01             SERVER-01$ CmRcService/SERVER-01
TERMSRV           SERVER-01             SERVER-01$ TERMSRV/SERVER-01
TERMSRV           SERVER-01.company.com SERVER-01$ TERMSRV/SERVER-01.company.com
WSMAN             SERVER-01             SERVER-01$ WSMAN/SERVER-01
WSMAN             SERVER-01.company.com SERVER-01$ WSMAN/SERVER-01.company.com
RestrictedKrbHost SERVER-01             SERVER-01$ RestrictedKrbHost/SERVER-01
HOST              SERVER-01             SERVER-01$ HOST/SERVER-01
RestrictedKrbHost SERVER-01.company.com SERVER-01$ RestrictedKrbHost/SERVER-01.company.com
HOST              SERVER-01.company.com SERVER-01$ HOST/SERVER-01.company.com

Description
---

This example lists the SPN(s) of the given account

### EXAMPLE 2

```powershell
Get-Spn -AccountName Administrator -UserAccount
```

Service  Name                       Hostname      SPN
-------  ----                       --------      ---
MSSQLSvc SERVER-01.company.com:1433 Administrator MSSQLSvc/SERVER-01.company.com:1433

Description
---

This example shows using the -UserAccount switch

## PARAMETERS

### -AccountName

The actual hostname of the object that you want to get

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

### -UserAccount

A switch to test for SPN's against user objects.
If not specified
we default to computer objects.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

FunctionName : Get-Spn
Created by   : jspatton
Date Coded   : 07/10/2013 15:07:12

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/SpnLibrary#Get-Spn](https://code.google.com/p/mod-posh/wiki/SpnLibrary#Get-Spn)

[http://msdn.microsoft.com/en-us/library/vstudio/system.servicemodel.configuration.identityelement.serviceprincipalname(v=vs.100).aspx](http://msdn.microsoft.com/en-us/library/vstudio/system.servicemodel.configuration.identityelement.serviceprincipalname(v=vs.100).aspx)

[http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx](http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx)
