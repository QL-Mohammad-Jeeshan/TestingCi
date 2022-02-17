set -eo pipefail

xcrun altool --upload-app -t ios -f build/TestingCi\ iOS.ipa -u "$APPLEID_USERNAME" -p "$APPLEID_PASSWORD" --verbose
