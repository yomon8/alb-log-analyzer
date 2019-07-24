$scriptPath = Split-Path -Parent ($MyInvocation.MyCommand.Path)
$env = Get-Content $scriptPath\..\conf\env.sh | ConvertFrom-StringData
$awsenv = Get-Content $scriptPath\..\conf\awsenv.sh | ConvertFrom-StringData
Invoke-Expression "docker run -it -e AWS_ACCESS_KEY_ID=$($awsenv.AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$($awsenv.AWS_SECRET_ACCESS_KEY) -e AWS_REGION=$($awsenv.AWS_REGION) -e S3_BUCKET=$($awsenv.S3_BUCKET) -e S3_PREFIX=$($awsenv.S3_PREFIX) -e DURATION_MINUTES=$($env.DURATION_MINUTES) -e UPDATE_COUNT=$($env.UPDATE_COUNT) --link $($env.CONTAINERNAME):solr yomon8/alb-banana-cli:$($env.CONTAINERNAME_CLI_VERSION)"
