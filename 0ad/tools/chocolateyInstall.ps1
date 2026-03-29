$ErrorActionPreference = 'Stop';

$fileName   = '0ad-0.28.0-win32.exe'
$fileName64 = '0ad-0.28.0-win64.exe'

$packageArgs = @{
  packageName    = '0ad'
  softwareName   = '0.A.D.'
  fileType       = 'exe'

  url            = "https://releases.wildfiregames.com/$fileName"
  checksum       = 'e2b30d28a80ea5cd9c07dce025b5c17a96f02dd1443f6802966876b2aa56642f'
  checksumType   = 'sha256'
  url64          = "https://releases.wildfiregames.com/$fileName64"
  checksum64     = '9b5e1a16d4e0df9c84e052f56fb75da69518d5634c88d2b38db69baee63c16a1'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
