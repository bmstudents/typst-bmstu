#!/usr/bin/env pwsh
# Keep this script simple and easily auditable!
$ErrorActionPreference = "Stop"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Script needs git installed to run"
    exit 1
}

if ($args.Count -eq 2) {
    $bmstu_tag = $args[0]
    $gost_tag = $args[1]
}
elseif ($args.Count -eq 1) {
    $bmstu_tag = $args[0]
    $gost_tag = $args[0]
}
else {
    $bmstu_tag = "latest"
    $gost_tag = "latest"
}

Write-Host "Installing typst 0.12.0"

# $v="0.12.0"; irm https://typst.community/typst-install/install.ps1 | iex

Write-Host "Installing 'bmstu' (version='$bmstu_tag') and 'gost7.32-2017' (version='$gost_tag') packages..."

$home_dir = "$env:APPDATA\typst\packages"

$clone_dir = [System.IO.Path]::Combine($env:TEMP, "typst")

# Clean clone directory if exists
if (Test-Path $clone_dir) {
    Remove-Item -Recurse -Force $clone_dir
}
New-Item -ItemType Directory -Path $clone_dir

# BMSTU
git clone "https://github.com/bmstudents/typst-bmstu.git" "$clone_dir\bmstu"
Set-Location "$clone_dir\bmstu"
if ($bmstu_tag -eq "latest") {
    $bmstu_tag = git describe --tags (git rev-list --tags --max-count=1)
}
git checkout -q $bmstu_tag

$package_dir = [System.IO.Path]::Combine($home_dir, "packages\docs\bmstu\$bmstu_tag")
if (Test-Path $package_dir) {
    Remove-Item -Recurse -Force $package_dir
}

New-Item -ItemType Directory -Path $package_dir
Move-Item "$clone_dir\bmstu\bmstu\*" $package_dir
Write-Host "Package 'bmstu' version='$bmstu_tag' was installed"

Remove-Item -Recurse -Force $clone_dir

# GOST
# git clone "https://github.com/bmstudents/typst-g7.32-2017.git" "$clone_dir\typst-g7.32-2017"

# Set-Location "$clone_dir\typst-g7.32-2017"
# if ($gost_tag -eq "latest") {
#     $gost_tag = git describe --tags (git rev-list --tags --max-count=1)
# }
# git checkout -q $gost_tag

# $package_dir = [System.IO.Path]::Combine($home_dir, "packages\docs\gost732-2017\$gost_tag")
# if (Test-Path $package_dir) {
#     Remove-Item -Recurse -Force $package_dir
# }

# New-Item -ItemType Directory -Path $package_dir
# Move-Item "$clone_dir\typst-g7.32-2017\gost732-2017\*" $package_dir
# Write-Host "Package 'gost 7.32-2017' version='$gost_tag' was installed"
