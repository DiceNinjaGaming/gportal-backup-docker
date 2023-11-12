<#
.Description
This function will read the config and return the specified value
#>

Function Get-ConfigItemByName([String]$item)
{
    $configs = Read-Configs
    Return $configs[$item]
}