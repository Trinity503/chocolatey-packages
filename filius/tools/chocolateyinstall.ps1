
$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://www.lernsoftware-filius.de/downloads/Setup/Filius-Setup_with-JRE-2.4.0.exe'
  softwareName  = 'filius*'
  checksum      = 'fa8d5d0d84e04ed1bcb42e7464701535b25b783939162c54498b73075808ca32'
  checksumType  = 'sha256'
  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs










    








