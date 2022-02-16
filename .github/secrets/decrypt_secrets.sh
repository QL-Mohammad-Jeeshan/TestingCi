set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/QL_Dist_Provisioning.mobileprovision ./.github/secrets/QL_Dist_Provisioning.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/QL_Dist_Certificates.p12 ./.github/secrets/QL_Dist_Certificates.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/QL_Dist_Provisioning.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/QL_Dist_Provisioning.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/QL_Dist_Certificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
