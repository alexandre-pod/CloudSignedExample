#!/bin/bash

# Stop the script when a command returns a nonzero exit code
set -e

cd $CI_WORKSPACE

if [[ "$CI_PRODUCT_PLATFORM" == 'macOS' ]];
then
	export UPLOADING_ASSET_PATH="$CI_DEVELOPMENT_SIGNED_APP_PATH/CloudSignedExample.app"
elif [[ "$CI_PRODUCT_PLATFORM" == 'iOS' ]];
then
	export UPLOADING_ASSET_PATH="$CI_DEVELOPMENT_SIGNED_APP_PATH/CloudSignedExample.ipa"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export REPO=alexandre-pod/CloudSignedExample
bundle exec fastlane github_release_from_xcode_cloud
