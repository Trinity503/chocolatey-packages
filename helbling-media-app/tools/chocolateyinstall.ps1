
$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = 'https://mediaapp.helbling.com/downloads/OU34DJKB/latest/HELBLING%20Media%20App%20Setup.exe'
  softwareName  = 'helbling-media-app*'
  checksum64    = '7b4362cf7ee8a6f03e17dd271be3092f8e7dcc7c539633f3a320c28e3dfb7c31'
  checksumType64= 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs










    








