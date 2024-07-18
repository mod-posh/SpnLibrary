---
external help file: SpnLibrary-help.xml
Module Name: SpnLibrary
online version: https://github.com/mod-posh/SpnLibrary/blob/main/docs/Find-DuplicateSpn.md#find-duplicatespn
schema: 2.0.0
---

# Find-DuplicateSpn

## SYNOPSIS

Find duplicate Service Principal Names across the Domain or Forest

## SYNTAX

```powershell
Find-DuplicateSpn [-ForestWide] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

To find a list of duplicate SPNs that have been registered with
Active Directory from a command prompt, use the
setspn -X -P command, where hostname is the actual host name of the
computer object that you want to query.

## EXAMPLES

### EXAMPLE 1

```powershell
Find-DuplicateSpn
Checking domain DC=company,DC=com

found 0 group of duplicate SPNs.
```

This example searches for duplicate SPNs in the current domain

### EXAMPLE 2

```powershell
Find-DuplicateSpn -ForestWide
Checking forest DC=company,DC=com
Operation will be performed forestwide, it might take a while.

found 0 group of duplicate SPNs.
```

This example searches for duplicate SPNs across the entire forest

## PARAMETERS

### -ForestWide

A switch that if present searches the entire forest for duplicates

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

FunctionName : Find-DuplicateSpn
Created by   : jspatton
Date Coded   : 07/10/2013 15:53:46

Searching for duplicates, especially forest-wide, can take a long
period of time and a large amount of memory.

Service Principal Names (SPNs) are not required to be unique across
forests, but duplicate SPNs can cause authentication issues during
cross-forest authentication.

## RELATED LINKS

[https://code.google.com/p/mod-posh/wiki/SpnLibrary#Find-DuplicateSpn](https://code.google.com/p/mod-posh/wiki/SpnLibrary#Find-DuplicateSpn)

[http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx](http://technet.microsoft.com/en-us/library/cc731241(WS.10).aspx)
