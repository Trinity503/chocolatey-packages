
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = ''

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url        = 'https://www.lernsoftware-filius.de/downloads/Setup/Filius-Setup_with-JRE-2.3.1.exe'
  url64bit      = $url64

  softwareName  = 'filius*'

  checksum      = '9c817760d78560ab1ad17a2c29f77cc28825205aab575e6b0ec7dfd61359ee9b'
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs










    








