---
external help file: SpnLibrary-help.xml
Module Name: SpnLibrary
online version: https://github.com/mod-posh/SpnLibrary/blob/main/docs/Add-Spn.md#add-spn
schema: 2.0.0
---

# Add-Spn

## SYNOPSIS

Adds a Service Principal Name to an account

## SYNTAX

```powershell
Add-Spn [[-Service] <String>] [[-Name] <String>] [[-AccountName] <String>] [-UserAccount] [-NoDupes]
 [-ForestWide] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

To add an SPN, use the setspn -s service/name hostname command at a
command prompt, where service/name is the SPN that you want to add
and hostname is the actual host name of the computer object that
you want to update.

For example, if there is an Active Directory domain controller with
the host name server1.contoso.com that requires an SPN for the
Lightweight Directory Access Protocol (LDAP), type
setspn -s ldap/server1.contoso.com server1, and then press ENTER
to add the SPN.

## EXAMPLES

### EXAMPLE 1

```powershell
Add-Spn -Service foo -Name server-01
```

Service           Name                  Hostname  SPN
-------           ----                  --------  ---
foo               server-01             server-01 foo/server-01
HOST              server-01             server-01 HOST/server-01
CmRcService       server-01.company.com server-01 CmRcService/server-01.company.com
CmRcService       server-01             server-01 CmRcService/server-01
TERMSRV           server-01             server-01 TERMSRV/server-01
TERMSRV           server-01.company.com server-01 TERMSRV/server-01.company.com
WSMAN             server-01             server-01 WSMAN/server-01
WSMAN             server-01.company.com server-01 WSMAN/server-01.company.com
RestrictedKrbHost server-01             server-01 RestrictedKrbHost/server-01
RestrictedKrbHost server-01.company.com server-01 RestrictedKrbHost/server-01.company.com
HOST              server-01.company.com server-01 HOST/server-01.company.com

Description
---

This example shows how to add an spn to an account

### EXAMPLE 2

```powershell
Add-Spn -Service bar -Name server-01 -NoDupes
```

Service           Name                  Hostname  SPN
-------           ----                  --------  ---
bar               server-01             server-01 bar/server-01
HOST              server-01.company.com server-01 HOST/server-01.company.com
RestrictedKrbHost server-01.company.com server-01 RestrictedKrbHost/server-01.company.com
RestrictedKrbHost server-01             server-01 RestrictedKrbHost/server-01
WSMAN             server-01.company.com server-01 WSMAN/server-01.company.com
WSMAN             server-01             server-01 WSMAN/server-01
TERMSRV           server-01.company.com server-01 TERMSRV/server-01.company.com
TERMSRV           server-01             server-01 TERMSRV/server-01
CmRcService       server-01             server-01 CmRcService/server-01
CmRcService       server-01.company.com server-01 CmRcService/server-01.company.com
HOST              server-01             server-01 HOST/server-01
foo               server-01             server-01 foo/server-01

Description
---

This example shows how to add an spn to an account while making sure it's
unique within the domain.
Add the -ForestWide switch to check across all
domains in the forest.

## PARAMETERS

### -AccountName

The actual hostname of the computer object that you want to update,
if blank we default to the value of parameter Namem.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: $Name
Accept pipeline input: False
Accept wildcard characters: False
```

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

### -NoDupes

Checks the domain for duplicate SPN's

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

### -Service

The name of the service to add

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

A switch to add SPN's to a user object

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

FunctionName : Add-Spn
Created by   : jspatton
Date Coded   : 07/10/2013 15:07:12

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/SpnLibrary#Add-Spn](https://code.google.com/p/mod-posh/wiki/SpnLibrary#Add-Spn)

[http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx](http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx)
