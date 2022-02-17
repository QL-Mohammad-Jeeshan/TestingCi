set -eo pipefail

xcodebuild -archivePath $PWD/build/TestingCi.xcarchive \
            -exportOptionsPlist TestingCi/TestingApp/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty

