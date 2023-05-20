
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://friedrich-folkmann.de/papdesigner/v2.2.0.8.08/PapDesigner-Setup.exe'
$url64      = ''

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'papdesigner*'

  checksum      = '8E113211BBFD080B4BE1730E352C4FB31D077D573D094A5B9099298136D5890E'
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs










    








