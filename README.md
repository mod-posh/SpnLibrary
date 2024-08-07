| Latest Version | PowerShell Gallery | Issues | License | Discord |
|-----------------|----------------|----------------|----------------|----------------|
| [![Latest Version](https://img.shields.io/github/v/tag/mod-posh/SpnLibrary)](https://github.com/mod-posh/SpnLibrary/tags) | [![Powershell Gallery](https://img.shields.io/powershellgallery/dt/SpnLibrary)](https://www.powershellgallery.com/packages/SpnLibrary) | [![GitHub issues](https://img.shields.io/github/issues/mod-posh/SpnLibrary)](https://github.com/mod-posh/SpnLibrary/issues) | [![GitHub license](https://img.shields.io/github/license/mod-posh/SpnLibrary)](https://github.com/mod-posh/SpnLibrary/blob/master/LICENSE) | [![Discord Server](https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0b5493894cf60b300587_full_logo_white_RGB.svg)]() |
# SetSpnLibrary PowerShell Module

## Overview

The SetSpnLibrary PowerShell module is designed to facilitate the management of Service Principal Names (SPNs) within an Active Directory (AD) environment. SPNs are critical for Kerberos authentication, as they uniquely identify instances of services running on servers. Proper management of SPNs ensures seamless authentication and helps prevent issues related to service identity.

## Features

### SPN Management

The module provides functions to handle various SPN-related tasks, including:

1. **Resetting SPNs**: This function resets the SPNs for a given account to their default values. It is useful when SPNs are misconfigured or corrupted, ensuring that the server can correctly authenticate services using Kerberos.

2. **Adding SPNs**: This function allows administrators to add new SPNs to a specified account. It supports options to prevent duplicates and can target either computer or user accounts.

3. **Removing SPNs**: This function facilitates the removal of SPNs from an account. It is useful for cleaning up outdated or incorrect SPNs that could cause authentication issues.

4. **Listing SPNs**: This function retrieves and lists all SPNs associated with a specified account. It can target both computer and user accounts, providing a clear view of the existing SPN configuration.

5. **Finding SPNs**: This function searches for SPNs based on service and/or account name. It helps administrators locate specific SPNs within the domain or across the entire forest.

6. **Finding Duplicate SPNs**: This function identifies duplicate SPNs within a domain or forest. Duplicate SPNs can cause authentication conflicts, so this function aids in maintaining a clean and unique SPN configuration.

## Benefits

- **Simplified Management**: The module automates complex SPN management tasks, reducing the need for manual intervention and command-line operations.
- **Error Prevention**: By providing options to check for duplicates and reset to default configurations, the module helps prevent common errors related to SPN mismanagement.
- **Improved Security**: Proper SPN management is crucial for secure Kerberos authentication. This module ensures that SPNs are correctly configured, enhancing overall security.
- **Flexibility**: The module supports operations on both computer and user accounts, making it versatile for various administrative needs within an AD environment.

## Usage Scenarios

- **Server Configuration**: When setting up or reconfiguring servers, administrators can use this module to ensure that SPNs are correctly set, preventing authentication issues.
- **Troubleshooting**: If services are failing to authenticate properly, the module can be used to diagnose and fix SPN-related problems.
- **Maintenance**: Regular checks for duplicate or misconfigured SPNs can be performed using the module to maintain a healthy AD environment.

The SetSpnLibrary PowerShell module is an essential tool for Active Directory administrators, providing robust and efficient SPN management capabilities.
# SpnLibrary Module

## Description

A simple PowerShell Module to work with SPNs in a Windows Domain.

## SpnLibrary Cmdlets

### [Add-Spn](Docs/Add-Spn.md)

To add an SPN, use the setspn -s service/name hostname command at a command
prompt, where service/name is the SPN that you want to add and hostname is the
actual host name of the computer object that you want to update.

### [Find-DuplicateSpn](Docs/Find-DuplicateSpn.md)

To find a list of duplicate SPNs that have been registered with Active Directory
from a command prompt, use the setspn -X -P command, where hostname is the
actual host name of the computer object that you want to query.

### [Find-Spn](Docs/Find-Spn.md)

To find a list of the SPNs that a computer has registered with Active Directory
from a command prompt, use the setspn -Q hostname command, where hostname is
the actual host name of the computer object that you want to query.

### [Get-Spn](Docs/Get-Spn.md)

To view a list of the SPNs that a computer has registered with Active Directory
from a command prompt, use the setspn -l hostname command, where hostname is the
actual host name of the computer object that you want to query.

### [Remove-Spn](Docs/Remove-Spn.md)

To remove an SPN, use the setspn -d service/namehostname command at a command
prompt, where service/name is the SPN that is to be removed and hostname is the
actual host name of the computer object that you want to update.

### [Reset-Spn](Docs/Reset-Spn.md)

If the SPNs that you see for your server display what seems to be incorrect
names; consider resetting the computer to use the default SPNs.

