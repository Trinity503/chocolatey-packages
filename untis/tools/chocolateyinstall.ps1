
$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.untis.at/fileadmin/downloads/2025/SetupUntis2025.exe'
  url64			= 'https://www.untis.at/fileadmin/downloads/2025/SetupUntis2025-x64.exe'
  softwareName  = 'untis*'
  checksum      = '4fc12af6b05597e4cc179f1ff10e61c22400488d70f8d317717c6606075a6535'
  checksum64	= '60e844652f589c87cdb65b0b189e9f85d86ef51dc36fa609f1219f8ad8199b55'
  checksumType  = 'sha256'
  checksumType64 = 'sha256'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs










    








