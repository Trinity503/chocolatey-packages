
$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.untis.at/fileadmin/downloads/2023/SetupUntis2023.exe'
  softwareName  = 'untis*'
  checksum      = '92cd7d8a27731723b3e20bbf8cbee68bc7065d23a3083f4b82afda0e6c0e6755'
  checksumType  = 'sha256'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs










    








