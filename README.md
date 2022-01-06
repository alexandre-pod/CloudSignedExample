
## Bump build number

```bash
agvtool bump
git add -u
git commit -m "Bump build number to $(agvtool vers -terse)"
```
## Export ipa using GitHub

Trigger the release workflow from the Action tab.


## Export ipa using fastlane

Requirements:
1. environment variables:
  - AUTHENTICATION_KEY_ISSUER_ID
  - AUTHENTICATION_KEY_ID
  - AUTHENTICATION_KEY_CONTENT
  - TEAM_ID
2. the API key file at path `./AuthKey.p8`


```bash
bundle exec fastlane release_to_ipa
```


## Export ipa using xcodebuild commands

Requirements:
1. environment variables:
  - AUTHENTICATION_KEY_ISSUER_ID
  - AUTHENTICATION_KEY_ID
  - AUTHENTICATION_KEY_PATH
  - TEAM_ID


```bash
./scripts/export_ios_app.sh
```
