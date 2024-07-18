---
Module Name: SpnLibrary
Module Guid: cd580065-e1f1-4d52-9ecd-2d8f6ace401b
Download Help Link: https://raw.githubusercontent.com/mod-posh/SpnLibrary/master/cabs/
Help Version: 1.0.0.0
Locale: en-US
---

# SpnLibrary Module

## Description

A simple PowerShell Module to work with SPNs in a Windows Domain.

## SpnLibrary Cmdlets

### [Add-Spn](Add-Spn.md)

To add an SPN, use the setspn -s service/name hostname command at a command
prompt, where service/name is the SPN that you want to add and hostname is the
actual host name of the computer object that you want to update.

### [Find-DuplicateSpn](Find-DuplicateSpn.md)

To find a list of duplicate SPNs that have been registered with Active Directory
from a command prompt, use the setspn -X -P command, where hostname is the
actual host name of the computer object that you want to query.

### [Find-Spn](Find-Spn.md)

To find a list of the SPNs that a computer has registered with Active Directory
from a command prompt, use the setspn -Q hostname command, where hostname is
the actual host name of the computer object that you want to query.

### [Get-Spn](Get-Spn.md)

To view a list of the SPNs that a computer has registered with Active Directory
from a command prompt, use the setspn -l hostname command, where hostname is the
actual host name of the computer object that you want to query.

### [Remove-Spn](Remove-Spn.md)

To remove an SPN, use the setspn -d service/namehostname command at a command
prompt, where service/name is the SPN that is to be removed and hostname is the
actual host name of the computer object that you want to update.

### [Reset-Spn](Reset-Spn.md)

If the SPNs that you see for your server display what seems to be incorrect
names; consider resetting the computer to use the default SPNs.
