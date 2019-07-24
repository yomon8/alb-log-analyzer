$scriptPath = Split-Path -Parent ($MyInvocation.MyCommand.Path)
$env = Get-Content $scriptPath\..\conf\env.sh | ConvertFrom-StringData

Invoke-Expression "docker rm -f $($env.CONTAINERNAME)"