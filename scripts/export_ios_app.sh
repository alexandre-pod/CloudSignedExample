#!/bin/bash

# Required environment values:
# - AUTHENTICATION_KEY_ISSUER_ID
# - AUTHENTICATION_KEY_ID
# - AUTHENTICATION_KEY_PATH
# - TEAM_ID

set -xo pipefail
set -e

cd "$(dirname $0)/.."

DATADIR=derivedData
OUTPUTDIR=release_output

IOS_ARCHIVE_PATH="$OUTPUTDIR/CloudSignedExample.xcarchive"

xcodebuild clean -scheme CloudSignedExample -derivedDataPath "$DATADIR"

xcodebuild archive -scheme CloudSignedExample \
	-archivePath "$IOS_ARCHIVE_PATH" \
	-derivedDataPath "$DATADIR" \
	-allowProvisioningUpdates \
	-authenticationKeyIssuerID "$AUTHENTICATION_KEY_ISSUER_ID" \
	-authenticationKeyID "$AUTHENTICATION_KEY_ID" \
	-authenticationKeyPath "$AUTHENTICATION_KEY_PATH" \
	CODE_SIGN_IDENTITY="" \
	CODE_SIGNING_REQUIRED="NO" \
	CODE_SIGN_ENTITLEMENTS="" \
	CODE_SIGNING_ALLOWED="NO"

sed "s/TEAM_ID/$TEAM_ID/" "./scripts/templateExportOptionsPlist.plist" > "$OUTPUTDIR/exportOptionsPlist.plist"

xcodebuild -exportArchive \
	-archivePath "$IOS_ARCHIVE_PATH" \
	-exportOptionsPlist "$OUTPUTDIR/exportOptionsPlist.plist" \
	-allowProvisioningUpdates \
	-authenticationKeyIssuerID "$AUTHENTICATION_KEY_ISSUER_ID" \
	-authenticationKeyID "$AUTHENTICATION_KEY_ID" \
	-authenticationKeyPath "$AUTHENTICATION_KEY_PATH" \
	-exportPath "$OUTPUTDIR"
