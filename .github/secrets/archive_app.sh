set -eo pipefail

xcodebuild  -workspace TestingCi.xcworkspace \
-scheme TestingCi \
-sdk iphoneos \
-configuration Debug \
-archivePath $PWD/build/TestingCi.xcarchive \
clean archive | xcpretty
