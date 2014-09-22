param
(
	[parameter()]
	[ValidateNotNullOrEmpty()]
	[String]$fileName,

	[parameter()]
	[String]$replacePattern = '\d+(\.\d+)+',
	
	[parameter()]
	[ValidateNotNullOrEmpty()]
	[String]$version
)
Write-Host "===================================================="
Write-Host "UpdateGlobalAssemblyInfoVersion.ps1 - Starting... "
Write-Host "	FileName:	$fileName"
Write-Host "	Version:	$version"
Write-Host "===================================================="
Write-Host
$startTime = Get-Date

$fileContent = Get-Content $fileName
$fileContent = $fileContent -replace $replacePattern, $version
Set-Content -Value $fileContent -Path $fileName

$endTime = Get-Date
$timeTaken = $endTime - $startTime
Write-Host
Write-Host "===================================================="
Write-Host "UpdateGlobalAssemblyInfoVersion.ps1 completed in:" $timeTaken.ToString("hh\:mm\:ss")
Write-Host "===================================================="