
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = ''
$url64      = ''

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = 'https://software.notenmanager.net/NMHV3Setup.exe'

  softwareName  = 'notenmanager-heimversion*'

  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = 'f97b305db53cca53757c24d52984091c247eaa2b76d8f7cc18e6f89bf8437f73'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT'
}

Install-ChocolateyPackage @packageArgs

















