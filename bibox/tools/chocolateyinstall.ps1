
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = 'https://static.bibox2.westermann.de/electron/autoUpdate/BiBox%202.0%202.4.6.msi'
  #https://static.bibox2.westermann.de/electron/autoUpdate/BiBox%202.0%202.4.4.msi

  softwareName  = 'bibox'

  checksum64    = 'c50c9a30168514578cd533f2d903685c30f3c9f2282fdb22022d70cd01d77df31c4cc56f805d9202026c200d08bb980054a9cba04fb5f00cf69c7730653f7fca'
  checksumType64= 'sha512'

  silentArgs    = "/qn ALLUSERS=1 /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








