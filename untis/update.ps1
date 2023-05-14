import-module au

#[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}


#$AllProtocols = [System.Net.SecurityProtocolType]'Tls11,Tls12'
#[System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols 


$domain   = 'https://www.untis.at'
$releases = "$domain/fileadmin/downloads/2023"
$file = "$releases/SetupUntis2023.exe"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
      #"(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
    #".\filius.nuspec" = @{
    #  "\<releaseNotes\>.+" = "<releaseNotes>$($Latest.ReleaseNotes)</releaseNotes>"
    #}
  }
}

#<h2 id="2023.2.0">2023.2.0 (30.8. 2022)</h2>

function global:au_GetLatest {

  Write-Output $file
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri 'https://www.untis.at/fileadmin/downloads/2023/releasenotes.html'
    
  $version = $download_page -match '<h2 id=\"\S*\">' | % {$Matches.Values -replace '<h2 id=\"','' -replace '\">',''} 
  $version.ToString()

  #echo $url;
  #$version = $url -split '-|.exe' | select -Last 1 -Skip 1 #3
  #$version  = ($url -split '/' | select -Last 1 -Skip 1)
  return @{ Version = $version; URL32 = $file } 
  
  #$releaseNotesUrl = "$domain/LibreCAD/LibreCAD/releases/tag/" + $version

  @{
    URL32 = $file
    Version = $version
  #  ReleaseNotes = $releaseNotesUrl
  }
}

update -ChecksumFor 32