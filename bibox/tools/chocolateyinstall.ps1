
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = 'https://static.bibox2.westermann.de/electron/autoUpdate//BiBox%202.0%202.4.4.msi'
  #https://static.bibox2.westermann.de/electron/autoUpdate/BiBox%202.0%202.4.4.msi

  softwareName  = 'bibox'

  checksum64    = '78E4FBDA66376CD529E83F6667D65A94C6490F2C189D340AC42D5D29261242E2'
  checksumType64= 'sha256'

  silentArgs    = "/qn ALLUSERS=1 /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








