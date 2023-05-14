import-module au

#[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}


#$AllProtocols = [System.Net.SecurityProtocolType]'Tls11,Tls12'
#[System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols 


$domain   = 'https://mediaapp.helbling.com'
$releases = "$domain/downloads/OU34DJKB/latest/HELBLING%20Media%20App%20Setup.exe"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64bit\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
      "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
    #".\helbling-media-app.nuspec" = @{
    #  "\<releaseNotes\>.+" = "<releaseNotes>$($Latest.ReleaseNotes)</releaseNotes>"
    #}
  }
}

function global:au_GetLatest {
  #$version = "3.7.0"
  
  $download_page = Invoke-WebRequest -Uri "https://helbling-media.de.aptoide.com/app"
  #alt $version = $download_page -match '<meta itemProp=\"version\" content=\"\S*\"' | % {$Matches.Values -replace '<meta itemProp=\"version\" content=\"','' -replace '\"',''} 
  $version = $download_page -match 'vername\":\"\S*\",\"vercode' | % {$Matches.Values -replace 'vername\":\"','' -replace '\",\"vercode',''} 
  $Checksum64 = $download_page -match 'md5sum\":\"\S*\",\"filesize' | % {$Matches.Values -replace 'md5sum\":\"','' -replace '\",\"filesize',''} 
  
  $version = $version.ToString()
    $Checksum64 = $Checksum64.ToString()
  
  $url = 'https://mediaapp.helbling.com/downloads/OU34DJKB/latest/HELBLING%20Media%20App%20Setup.exe'

  #$version  = ($url -split '/' | select -Last 1 -Skip 1)
  return @{ Version = $version; URL64 = $url; checksum64 = $Checksum64; ChecksumType64 = 'md5'   } 
  
  #$releaseNotesUrl = "$domain/LibreCAD/LibreCAD/releases/tag/" + $version

  @{
    URL = $url;
    Version = $version
    Checksum64 = $Checksum64
    ChecksumType64 = 'md5'
  #  ReleaseNotes = $releaseNotesUrl
  }

}

update -ChecksumFor none