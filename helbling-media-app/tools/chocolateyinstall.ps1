
$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = 'https://mediaapp.helbling.com/downloads/OU34DJKB/latest/HELBLING%20Media%20App%20Setup.exe'
  softwareName  = 'helbling-media-app*'
  checksum64    = 'ba844cf71c873a1063c309f709cdc6d0f027fb1261e0eeb313ca683811f511f3'
  checksumType64= 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs










    








