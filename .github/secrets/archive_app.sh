set -eo pipefail

xcodebuild -workspace TestingCi.xcworkspace \
            -scheme TestingCi\ iOS \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/TestingCi.xcarchive \
            clean archive | xcpretty
