
$ErrorActionPreference = 'Stop';


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64bit      = 'https://software.notenmanager.net/NMHV3Setup.exe'
  softwareName  = 'notenmanager-heimversion*'
  checksum64    = 'a62c6193293ad4a5eb89a79a1662390c0b91ab7ea94ab410527c172fb3595561'
  checksumType64= 'sha256'
  silentArgs   = '/VERYSILENT'
}

Install-ChocolateyPackage @packageArgs

















