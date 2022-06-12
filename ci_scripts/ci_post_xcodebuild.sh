#!/bin/sh

# Stop the script when a command returns a nonzero exit code
set -e

if [ $CI_XCODEBUILD_EXIT_CODE -ne 0 ]; then
	echo "Skipping script because xcodebuild failed"
	exit 1
fi

if [[ "$CI_START_CONDITION" = 'push' && "$CI_XCODEBUILD_ACTION" = 'archive' && "$CI_BRANCH" = 'xcode-cloud-test' ]];
then
	./CD/handle_xcodebuild_success.sh
else
	echo "Nothing to do - did not trigger CD conditions"
fi
