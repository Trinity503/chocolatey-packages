import-module au



$domain   = 'https://www.lernsoftware-filius.de'
$releases = "$domain/Herunterladen"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
    ".\filius.nuspec" = @{
      "\<releaseNotes\>.+" = "<releaseNotes>$($Latest.ReleaseNotes)</releaseNotes>"
    }
  }
}

function global:au_GetLatest {

  
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases 
  $regex    = '\.exe$'
  $url   = $download_page.links | ? href -match $regex | select -First 1 -expand href
  $version = $url -split '-|.exe' | select -Last 1 -Skip 1 #3
  return @{ Version = $version; URL32 = $url } 
  

  @{
    URL32 = $domain + $url
    Version = $version
  }
}

update -ChecksumFor 32