#!/bin/bash -e
################################################################################
##  File:  install-haskell.sh
##  Desc:  Install Haskell, GHCup, Cabal and Stack
################################################################################

# Source the helpers for use with the script
###source $HELPER_SCRIPTS/etc-environment.sh

# Any nonzero value for non-interactive installation
###export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
###export BOOTSTRAP_HASKELL_INSTALL_NO_STACK_HOOK=1
###eexport GHCUP_INSTALL_BASE_PREFIX=/usr/local
###eexport BOOTSTRAP_HASKELL_GHC_VERSION=0
###eghcup_bin=$GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin
###eset_etc_environment_variable "BOOTSTRAP_HASKELL_NONINTERACTIVE" $BOOTSTRAP_HASKELL_NONINTERACTIVE
###eset_etc_environment_variable "GHCUP_INSTALL_BASE_PREFIX" $GHCUP_INSTALL_BASE_PREFIX

# Install GHCup
###ecurl --proto '=https' --tlsv1.2 -fsSL https://get-ghcup.haskell.org | sh > /dev/null 2>&1 || true
###eexport PATH="$ghcup_bin:$PATH"
###eprepend_etc_environment_path $ghcup_bin

###eavailable_versions=$(ghcup list -t ghc -r | grep -v "prerelease" | awk '{print $2}')

# Install 2 latest Haskell Major.Minor versions
###emajor_minor_versions=$(echo "$available_versions" | cut -d"." -f 1,2 | uniq | tail -n2)
###efor major_minor_version in $major_minor_versions; do
###e    full_version=$(echo "$available_versions" | grep "$major_minor_version." | tail -n1)
###e    echo "install ghc version $full_version..."
###e    ghcup install ghc $full_version
###e    ghcup set ghc $full_version
###edone

echo "install cabal... is skipped"
###eghcup install cabal latest

###echmod -R 777 $GHCUP_INSTALL_BASE_PREFIX/.ghcup
###eln -s $GHCUP_INSTALL_BASE_PREFIX/.ghcup /etc/skel/.ghcup

# Install the latest stable release of haskell stack
###ecurl -fsSL https://get.haskellstack.org/ | bash

###einvoke_tests "Haskell"
