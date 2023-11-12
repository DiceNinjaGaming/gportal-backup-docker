<#
.Description
This script will get the configuration settings and write them to disk.

This is necessary because the information is passed in via environment variables, which are not available to the
BackupService process(es) spawned by cron.
#>

Function Write-ConfigsToDisk
{
    $config = @{}
    $config["BACKUPS_MAX_COUNT"] = $env:BACKUPS_MAX_COUNT
    $config["LONGTERM_BACKUPS_MAX_COUNT"] = $env:LONGTERM_BACKUPS_MAX_COUNT

    Write-Output "Writing config info to file"
    $configJson = ConvertTo-Json $config
    $configJson | Out-File -Path $global:ConfigFile
} # Function Write-ConfigToDisk