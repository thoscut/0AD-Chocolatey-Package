import-module au

$releases = 'https://play0ad.com/download/win'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*\`$fileName\s*=\s*)('.*')"   = "`$1'0ad-$($Latest.Version)-win32.exe'"
            "(?i)(^\s*\`$fileName64\s*=\s*)('.*')" = "`$1'0ad-$($Latest.Version)-win64.exe'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"      = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"    = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re = '0ad-([.\d]+)-win64\.exe$'
    $url64 = $download_page.Links | Where-Object href -match $re | Select-Object -First 1 -ExpandProperty href
    $version = $Matches[1]

    $url32 = $url64 -replace 'win64', 'win32'

    @{
        Version    = $version
        URL32      = $url32
        URL64      = $url64
    }
}

update -ChecksumFor all
