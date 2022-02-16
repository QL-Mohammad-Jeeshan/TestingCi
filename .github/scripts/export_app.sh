set -eo pipefail

xcodebuild -archivePath $PWD/build/TestingCi.xcarchive \
            -exportOptionsPlist TestingCi/TestingCi/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty

