#!/bin/bash

# Stop the script when a command returns a nonzero exit code
set -e

pwd

cd $CI_WORKSPACE

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export REPO=alexandre-pod/CloudSignedExample
bundle exec fastlane github_release_from_xcode_cloud
