#!/bin/bash

# Runs times:
# - 68.2s
# - 59.0s

# Stop the script when a command returns a nonzero exit code
set -e

echo "## Configuring gems to be installed in user directory"
cat << EOF >> ~/.zshrc
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="\$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:\$PATH"
fi
EOF
source ~/.zshrc

echo "## Install bundler"
gem install --user-install bundler:2.2.22

echo "## Install project gem dependencies"
bundle config set --local path '~/vendor/bundle'
bundle install
