#!/usr/bin/env sh

NO_FORMAT="\033[0m"
C_RED="\033[38;5;196m"
C_GREEN="\033[38;5;28m"

set -e

error() {
    echo "${C_RED}Unexpected error while installing packages${NO_FORMAT}"
}

main() {
    if ! command -v git 2>&1 >/dev/null
    then
        echo "Script needs ${C_RED}git${NO_FORMAT} installed to run" 
        exit 1
    fi

    if [ "$#" -eq 2 ]; then
        bmstu_tag=$1
        gost_tag=$2
    elif [ "$#" -eq 1 ]; then
        bmstu_tag=$1
        gost_tag=$1
    else 
        bmstu_tag="latest"
        gost_tag="latest"
    fi

    echo "${C_GREEN}Installing \"bmstu\" (version=\"$bmstu_tag\") and \"gost7.32-2017\" (version=\"$gost_tag\") packages...${NO_FORMAT}"

    if [ "$OSTYPE" = "darwin"* ]; then 
        # macos
        home_dir="$HOME/Library/Application Support/typst"
    else
        # linux
        home_dir="$HOME/.local/share/typst"
    fi

    clone_dir="$home_dir/tmp"

    if [ -d "$clone_dir" ]; then 
        rm -rf "$clone_dir"
    fi
    mkdir -p "$clone_dir" || return 1

    # BMSTU
    git clone https://github.com/bmstudents/typst-bmstu.git "$clone_dir/bmstu" || return 1
    cd "$clone_dir/bmstu"
    if [ $bmstu_tag = "latest" ]; then
        bmstu_tag=$(git describe --tags "$(git rev-list --tags --max-count=1)" || return 1)
    fi
    git checkout -q $bmstu_tag || return 1

    package_dir="$home_dir/packages/docs/bmstu/$bmstu_tag"
    if [ -d "$package_dir" ]; then 
        rm -rf "$package_dir"
    fi
    mkdir -p "$package_dir" || return 1
    mv "$clone_dir/bmstu/bmstu/"* "$package_dir/" || return 1

    echo "${C_GREEN}Package \"bmstu\" version=\"$bmstu_tag\" was installed${NO_FORMAT}"

    # GOST
    git clone https://github.com/bmstudents/typst-g7.32-2017.git "$clone_dir/typst-g7.32-2017" || return 1
    cd "$clone_dir/typst-g7.32-2017"
    if [ $gost_tag = "latest" ]; then
        gost_tag=$(git describe --tags "$(git rev-list --tags --max-count=1)" || return 1)
    fi
    git checkout -q $gost_tag || return 1

    package_dir="$home_dir/packages/docs/gost732-2017/$gost_tag"
    if [ -d "$package_dir" ]; then 
        rm -rf "$package_dir"
    fi
    mkdir -p "$package_dir" || return 1
    mv "$clone_dir/typst-g7.32-2017/gost732-2017/"* "$package_dir/" || return 1

    echo "${C_GREEN}Package \"gost 7.32-2017\" version=\"$gost_tag\" was installed${NO_FORMAT}"

    rm -rf "$clone_dir"
}

main "$@" || error
