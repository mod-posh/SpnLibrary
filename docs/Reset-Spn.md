---
external help file: SpnLibrary-help.xml
Module Name: SpnLibrary
online version: https://github.com/mod-posh/SpnLibrary/blob/main/docs/Reset-Spn.md#reset-spn
schema: 2.0.0
---

# Reset-Spn

## SYNOPSIS

Reset the SPN for a given account

## SYNTAX

```powershell
Reset-Spn [[-AccountName] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

If the SPNs that you see for your server display what seems to be
incorrect names; consider resetting the computer to use the default
SPNs.

To reset the default SPN values, use the setspn -r hostname
command at a command prompt, where hostname is the actual host name
of the computer object that you want to update.

For example, to reset the SPNs of a computer named server2, type
setspn -r server2, and then press ENTER.
You receive confirmation
if the reset is successful.
To verify that the SPNs are displayed
correctly, type setspn -l server2, and then press ENTER.

## EXAMPLES

### EXAMPLE 1

```powershell
Reset-Spn -AccountName server-01

Service           Name                  Hostname  SPN
-------           ----                  --------  ---
HOST              server-01.company.com server-01 HOST/server-01.company.com
HOST              server-01             server-01 HOST/server-01
RestrictedKrbHost server-01.company.com server-01 RestrictedKrbHost/server-01.company.com
RestrictedKrbHost server-01             server-01 RestrictedKrbHost/server-01
WSMAN             server-01.company.com server-01 WSMAN/server-01.company.com
WSMAN             server-01             server-01 WSMAN/server-01
TERMSRV           server-01.company.com server-01 TERMSRV/server-01.company.com
TERMSRV           server-01             server-01 TERMSRV/server-01
CmRcService       server-01             server-01 CmRcService/server-01
CmRcService       server-01.company.com server-01 CmRcService/server-01.company.com
```

This example shows how to reset the spn of a given account. This would be used
if you were experiencing issues with service account logins. See the Link
section for relevant URL's.

## PARAMETERS

### -AccountName

The actual hostname of the computer object that you want to update,
if blank we default to the value of parameter Namem.

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

FunctionName : Reset-Spn
Created by   : jspatton
Date Coded   : 07/10/2013 15:07:12

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/SpnLibrary#Reset-Spn](https://code.google.com/p/mod-posh/wiki/SpnLibrary#Reset-Spn)

[http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx](http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx)

[http://technet.microsoft.com/en-us/library/579246c8-2e32-4282-bce7-3209d1ea8bf1](http://technet.microsoft.com/en-us/library/579246c8-2e32-4282-bce7-3209d1ea8bf1)
