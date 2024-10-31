#!/bin/bash -e
################################################################################
##  File:  install-terragrunt.sh
##  Desc:  Install terragrunt
################################################################################

source $HELPER_SCRIPTS/install.sh

# Fetch latest release version from GitHub
TERRAGRUNT_VERSION=$(curl -s https://api.github.com/repos/gruntwork-io/terragrunt/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

# Download Terragrunt binary
TERRAGRUNT_URL="https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64"
echo "Downloading Terragrunt ${TERRAGRUNT_VERSION}..."
curl -Lo /tmp/terragrunt "$TERRAGRUNT_URL"

# Check if download was successful
if [ $? -ne 0 ]; then
    echo "Failed to download Terragrunt. Please check your internet connection and try again."
    exit 1
fi

# Make the binary executable
chmod +x /tmp/terragrunt

# Move Terragrunt binary to a directory in your PATH
sudo mv /tmp/terragrunt /usr/local/bin/terragrunt

echo "Terragrunt ${TERRAGRUNT_VERSION} has been successfully installed."

export PATH="/usr/local/bin:$PATH"
echo "Terragrunt version is: $(terragrunt -v)"

invoke_tests "Tools" "Terragrunt"
