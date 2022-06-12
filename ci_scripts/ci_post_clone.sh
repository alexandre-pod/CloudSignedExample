#!/bin/sh

# Stop the script when a command returns a nonzero exit code
set -e

if [[ "$CI_START_CONDITION" = 'push' && "$CI_XCODEBUILD_ACTION" = 'archive' && "$CI_BRANCH" = 'xcode-cloud-test' ]];
then
	./CD/install_dependencies.sh
fi
