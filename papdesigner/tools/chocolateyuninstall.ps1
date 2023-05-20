


$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'papdesigner*'
  fileType      = 'EXE'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
  file = 'C:\Program Files (x86)\PapDesigner\Uninstall.exe'
}

$uninstalled = $false

Uninstall-ChocolateyPackage @packageArgs



