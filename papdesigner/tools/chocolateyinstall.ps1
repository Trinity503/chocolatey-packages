
$ErrorActionPreference = 'Stop';



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'http://friedrich-folkmann.de/papdesigner/v2.2.0.8.08/PapDesigner-Setup.exe'
  softwareName  = 'papdesigner*'
  checksum      = '8E113211BBFD080B4BE1730E352C4FB31D077D573D094A5B9099298136D5890E'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs










    








