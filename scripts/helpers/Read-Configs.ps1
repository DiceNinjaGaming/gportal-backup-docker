<#
.Description
This script will read the configs, parse their relevant information, and return hashtable of objects with those details
#>

Get-ChildItem -Path /scripts/classes -Filter *.ps1 | ForEach-Object { . $_.FullName }

function Read-Configs
{
    # Write-Information "Reading config info from file"
    $fileContents = Get-Content -Path $global:ConfigFile -Raw
    $configJson = ConvertFrom-Json $fileContents
    $config = @{}

    foreach ($property in $configJson.PSObject.Properties)
    {
        $config[$property.Name] = $property.Value
    }

    Return $config
} # function Read-Configs

