$ErrorActionPreference = 'Stop';
$InstallLocation = Get-AppInstallLocation papdesigner
$uninstaller     = "$installLocation\uninstall.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'papdesigner*'
  fileType      = 'EXE'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
  file = $uninstaller
}

if (!(Test-Path $uninstaller)) { Write-Warning "$packageName has already been uninstalled by other means."; return }

Uninstall-ChocolateyPackage @packageArgs

