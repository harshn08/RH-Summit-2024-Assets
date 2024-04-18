#!/bin/bash

# URL of the jq binary
JQ_URL="https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64"

# Target directory to save the binary
TARGET_DIR="$HOME/bin"

# Check if target directory exists, create if not
mkdir -p $TARGET_DIR

# Download the binary using wget
echo "Downloading jq binary..."
wget -q -O "${TARGET_DIR}/jq" $JQ_URL

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Download failed. Please check the URL and your internet connection."
    exit 1
else
    echo "Download completed successfully."
fi

# Make the binary executable
chmod +x "${TARGET_DIR}/jq"

# Add target directory to PATH if not already added
if [[ ":$PATH:" != *":$TARGET_DIR:"* ]]; then
    echo 'export PATH=$PATH:'"$TARGET_DIR" >> $HOME/.bashrc
    echo "Added $TARGET_DIR to PATH in .bashrc."
    # Reload .bashrc to update PATH for the current session
    source $HOME/.bashrc
fi

echo "jq is now executable and located in $TARGET_DIR. Ready to use from anywhere."