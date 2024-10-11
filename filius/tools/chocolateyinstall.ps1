
$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://www.lernsoftware-filius.de/downloads/Setup/Filius-Setup_with-JRE-2.6.1.exe'
  softwareName  = 'filius*'
  checksum      = '3b618e31635caf9fd9ade6fb3c0237527586d3e297d52966727220935999778b'
  checksumType  = 'sha256'
  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs










    








