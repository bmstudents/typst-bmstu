$ErrorActionPreference = "Stop"

$C_RED = "`033[38;5;196m"
$C_GREEN = "`033[38;5;28m"
$NO_FORMAT = "`033[0m"

function error {
    Write-Host "$C_RED Unexpected error while installing packages $NO_FORMAT"
}

function main {
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Write-Host "Script needs $C_RED git $NO_FORMAT installed to run"
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

    Write-Host "${C_GREEN}Installing typst 0.12.0${NO_FORMAT}"

    v="0.12.0"; irm https://typst.community/typst-install/install.ps1 | iex

    Write-Host "$C_GREEN Installing 'bmstu' (version='$bmstu_tag') and 'gost7.32-2017' (version='$gost_tag') packages... $NO_FORMAT"

    $home_dir = "%APPDATA%\typst\packages"

    $clone_dir = [System.IO.Path]::Combine($home_dir, "tmp")

    # Clean clone directory if exists
    if (Test-Path $clone_dir) {
        Remove-Item -Recurse -Force $clone_dir
    }
    New-Item -ItemType Directory -Path $clone_dir

    # BMSTU
    git clone "https://github.com/bmstudents/typst-bmstu.git" "$clone_dir\bmsu" | Out-Null

    Set-Location "$clone_dir\bmsu"
    if ($bmstu_tag -eq "latest") {
        $bmstu_tag = git describe --tags (git rev-list --tags --max-count=1)
    }
    git checkout -q $bmstu_tag

    $package_dir = [System.IO.Path]::Combine($home_dir, "packages\docs\bmstu\$bmstu_tag")
    if (Test-Path $package_dir) {
        Remove-Item -Recurse -Force $package_dir
    }
    New-Item -ItemType Directory -Path $package_dir

    Move-Item "$clone_dir\bmsu\bmstu\*" $package_dir

    Write-Host "$C_GREEN Package 'bmstu' version='$bmstu_tag' was installed $NO_FORMAT"

    # GOST
    git clone "https://github.com/bmstudents/typst-g7.32-2017.git" "$clone_dir\typst-g7.32-2017" | Out-Null

    Set-Location "$clone_dir\typst-g7.32-2017"
    if ($gost_tag -eq "latest") {
        $gost_tag = git describe --tags (git rev-list --tags --max-count=1)
    }
    git checkout -q $gost_tag

    $package_dir = [System.IO.Path]::Combine($home_dir, "packages\docs\gost732-2017\$gost_tag")
    if (Test-Path $package_dir) {
        Remove-Item -Recurse -Force $package_dir
    }
    New-Item -ItemType Directory -Path $package_dir

    Move-Item "$clone_dir\typst-g7.32-2017\gost732-2017\*" $package_dir

    Write-Host "$C_GREEN Package 'gost 7.32-2017' version='$gost_tag' was installed $NO_FORMAT"

    Remove-Item -Recurse -Force $clone_dir
}

try {
    main $args
}
catch {
    error
}
