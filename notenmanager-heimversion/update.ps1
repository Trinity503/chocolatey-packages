import-module au

#[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}


#$AllProtocols = [System.Net.SecurityProtocolType]'Tls11,Tls12'
#[System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols 


$domain   = 'https://www.notenmanager.net'
$releases = "$domain//heimversion/hv_download/"
$file = "https://software.notenmanager.net/NMHV3Setup.exe"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64bit\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
      #"(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
    #".\notenmanager-heimversion.nuspec" = @{
    #  "\<releaseNotes\>.+" = "<releaseNotes>$($Latest.ReleaseNotes)</releaseNotes>"
    #}
  }
}



function global:au_GetLatest {

  Write-Output $file
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri 'https://www.notenmanager.net/heimversion/hv_download/'
    
  #$version = $download_page -match '<h2 id=\"\S*\">' | % {$Matches.Values -replace '<h2 id=\"','' -replace '\">',''} 
  $version = $download_page -match 'Notenmanager Heimversion Setup</a> Version \S* vom' | % {$Matches.Values -replace 'Notenmanager Heimversion Setup</a> Version ','' -replace ' vom',''} 
  #Notenmanager Heimversion Setup</a> Version 3.3.43 vom
  $version.ToString()

  #echo $url;
  #$version = $url -split '-|.exe' | select -Last 1 -Skip 1 #3
  #$version  = ($url -split '/' | select -Last 1 -Skip 1)
  return @{ Version = $version; URL64 = $file } 
  
  #$releaseNotesUrl = "$domain/LibreCAD/LibreCAD/releases/tag/" + $version

  @{
    URL64 = $file
    Version = $version
  #  ReleaseNotes = $releaseNotesUrl
  }
}

update -ChecksumFor 64  -NoCheckChocoVersion