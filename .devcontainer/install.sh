#!/bin/bash

# Get certificates
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

# Add package repo
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/debian/$(lsb_release -rs | cut -d'.' -f 1)/prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'

# Debug: Validate release
cat /etc/apt/sources.list.d/dotnetdev.list

# Update apt
sudo apt-get update 

# Install Azure Functions Core Tools and other tools...
sudo apt-get install -y azure-functions-core-tools httpie bash-completion jq

# Install Google chrome to use the auchenberg.vscode-browser-preview extension
pushd ~
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f -y
sudo dpkg -i google-chrome-stable_current_amd64.deb
popd
