#!/bin/bash

# Define the version and download URL
VERSION="cockroach-v23.2.4.linux-amd64"
URL="https://binaries.cockroachdb.com/${VERSION}.tgz"

# Create a bin directory in the user's home if it doesn't exist
mkdir -p ~/bin

# Download the tarball
echo "Downloading CockroachDB ${VERSION}..."
wget -qO- $URL | tar xvz -C ~/bin --strip-components=1

# Add the ~/bin directory to PATH in .bashrc if it's not already included
if ! grep -q 'export PATH=$PATH:$HOME/bin' ~/.bashrc; then
  echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
  echo "PATH updated in .bashrc; changes will take effect in new terminal sessions."
fi

# Source .bashrc to update PATH for current session
source ~/.bashrc

echo "Installation complete. CockroachDB binary is located in ~/bin"