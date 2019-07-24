$scriptPath = Split-Path -Parent ($MyInvocation.MyCommand.Path)
$env = Get-Content $scriptPath\..\conf\env.sh | ConvertFrom-StringData

Invoke-Expression "docker run --name $($env.CONTAINERNAME) -d -p $($env.SOLRPORT):$($env.SOLRPORT) yomon8/alb-banana:$($env.CONTAINERNAME_SRV_VERSION)"
sleep 3
Invoke-Expression "$scriptPath\loaddata.ps1"