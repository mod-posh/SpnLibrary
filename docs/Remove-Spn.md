---
external help file: SpnLibrary-help.xml
Module Name: SpnLibrary
online version: https://github.com/mod-posh/SpnLibrary/blob/main/docs/Remove-Spn.md#remove-spn
schema: 2.0.0
---

# Remove-Spn

## SYNOPSIS

Removes a Service Principal Name from an account

## SYNTAX

```powershell
Remove-Spn [[-Service] <String>] [[-Name] <String>] [[-AccountName] <String>] [-UserAccount]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

To remove an SPN, use the setspn -d service/namehostname command at
a command prompt, where service/name is the SPN that is to be
removed and hostname is the actual host name of the computer object
that you want to update.

For example, if the SPN for the Web service on a computer named
Server3.contoso.com is incorrect, you can remove it by typing
setspn -d http/server3.contoso.com server3, and then pressing ENTER.

## EXAMPLES

### EXAMPLE 1

```powershell
Remove-Spn -Service foo -Name server-01

Service           Name                  Hostname  SPN
-------           ----                  --------  ---
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
```

This example shows how to remove an SPN from an account.

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

FunctionName : Remove-Spn
Created by   : jspatton
Date Coded   : 07/10/2013 15:07:12

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/SpnLibrary#Remove-Spn](https://code.google.com/p/mod-posh/wiki/SpnLibrary#Remove-Spn)

[http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx](http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx)
