


$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'notenmanager-heimversion*'
  fileType      = 'EXE'
  file = "C:\Program Files (x86)\beSoft\NManagerHV\unins000.exe"
  silentArgs   = '/VERYSILENT'           
}

Uninstall-ChocolateyPackage @packageArgs





