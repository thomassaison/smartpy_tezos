#!/usr/bin/env bash

set -euo pipefail

usage () {
    cat <<EOF
Usage: $(basename $0) <options>

The options are as follows:

--prefix <prefix>
        Install into directory <prefix>.

--from <url>
        Fetch the installation files from <url>. May be of the form 'file:///path/to/files/'.

--native
        Install native binaries (experimental).

--yes
        Answer 'y' to all questions during installation.

--help

EOF
exit
}

prefix=~/smartpy-cli
from=https://legacy.smartpy.io/cli
native=false
yes=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --prefix)
            prefix="$2"
            shift 2
            ;;
        --from)
            from="$2"
            shift 2
            ;;
        --native)
            native=true
            shift
            ;;
        --yes)
            yes=true
            shift
            ;;
        --help)
            usage
            ;;
        *)
            echo Unexpected argument: "$1"
            exit 1
            ;;
    esac
done


echo -n "Install into $prefix? [y/N] "
if [ "$yes" == "true" ]; then
    echo "y"
else
    read ok
    if [ "$ok" != "y" ]; then
        echo "Installation aborted."
        exit 1
    fi
fi

if [ -d "$prefix" ]; then
    echo -n "The directory $prefix exists. Delete and replace? [y/N] "
    if [ "$yes" == "true" ]; then
        echo "y"
    else
        read ok
        if [ "$ok" != "y" ]; then
            echo "Installation aborted."
            exit 1
        fi
    fi
    rm -rf "$prefix"
fi

if [ -e "$prefix" ]; then
    echo "$prefix exists, but is not a directory."
    exit 1
fi

mkdir -p "$prefix"

echo "Downloading files..."
curl "$from"/smartpy-cli.tar.gz | tar xzf - -C "$prefix"
if [ "$native" != true ]; then
    rm -f "$prefix/smartpyc"
fi

echo "Installing npm packages..."
cd "$prefix"
npm --loglevel silent --ignore-scripts init --yes > /dev/null
npm --loglevel silent --ignore-scripts install libsodium-wrappers-sumo bs58check js-sha3 tezos-bls12-381 chalk @smartpy/originator @smartpy/timelock
cd -

echo "Installation successful in $prefix."
