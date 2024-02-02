# check if run as Administrator
$Current = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$CurrenPrincipal = New-Object System.Security.Principal.WindowsPrincipal($Current)
if ( -Not $CurrenPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))
{
  Write-Host "Please run as Administrator"
  exit
}

$NvimConfigPath = "$ENV:USERPROFILE\AppData\Local\nvim"
$WorkPath = "$(Get-Location)"
# remove old nvim config
if (Test-Path $NvimConfigPath)
{
  Remove-Item -Recurse -Force $NvimConfigPath
}

# create symbolic link
New-Item -ItemType SymbolicLink -Verbose -Path $NvimConfigPath -Target "$WorkPath\nvchad"
if (-Not (Test-Path $NvimConfigPath\ftplugin))
{
  New-Item -ItemType SymbolicLink -Verbose -Path $NvimConfigPath\ftplugin -Target "$WorkPath\ftplugin"
}
if (-Not (Test-Path $NvimConfigPath\lua\custom))
{
  New-Item -ItemType SymbolicLink -Verbose -Path $NvimConfigPath\lua\custom -Target "$WorkPath\lua\custom"
}
