import-module au

Function Get-RedirectedUrl {

    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )

    $request = [System.Net.WebRequest]::Create($url)
    $request.AllowAutoRedirect=$false
    $response=$request.GetResponse()
    Write-Output $response

    If ($response.StatusCode -eq "Found")
    {
        $response.GetResponseHeader("Location")
    }
}

#[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}


#$AllProtocols = [System.Net.SecurityProtocolType]'Tls11,Tls12'
#[System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols 


$domain   = 'https://static.bibox2.westermann.de'
$releases = "$domain/electron/autoUpdate/"


function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64bit\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
      "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
    ".\bibox.nuspec" = @{
      "\<releaseNotes\>.+" = "<releaseNotes>$($Latest.ReleaseNotes)</releaseNotes>"
    }
  }
}

function global:au_GetLatest {

 
$download_page = Invoke-WebRequest -Uri $releases\latest.yml -OutFile latest.yml
$file = Get-Content latest.yml
$version= Select-String -Pattern "version: (.*)" -Path latest.yml
$version = $version.Matches.groups[1].value
$version
$url= Select-String -Pattern "url: (.*)" -Path latest.yml
$url = $releases + "/" + [uri]::EscapeDataString( $url.Matches.groups[1].value)
$url
$sha512= Select-String -Pattern "sha512: (.*)" -Path latest.yml
$sha512 = $sha512.Matches.groups[1].value
$sha512

  return @{ Version = $version; URL64 = $url } 
  
  #$releaseNotesUrl = "$domain/LibreCAD/LibreCAD/releases/tag/" + $version

  @{
    URL64 = $url
    Version = $version
  #  ReleaseNotes = $releaseNotesUrl
  }
}

update -ChecksumFor 64




