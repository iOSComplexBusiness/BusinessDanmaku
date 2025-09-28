#!/bin/bash

VersionString=`grep -E 's.version.*=' BusinessDanmaku.podspec`
VersionNumber=`tr -cd 0-9 <<<"$VersionString"`

NewVersionNumber=$(($VersionNumber + 1))
LineNumber=`grep -nE 's.version.*=' BusinessDanmaku.podspec | cut -d : -f1`
sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" BusinessDanmaku.podspec

echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"

git add .
git commit -am ${NewVersionNumber}
git tag ${NewVersionNumber}
git push origin main --tags
pod repo push zy-specs BusinessDanmaku.podspec --verbose --allow-warnings --use-libraries --use-modular-headers

#  pod repo list 
# ...
#zy-specs
#- Type: git (unknown)
#- URL:  https://github.com/iOSComplexBusiness/PrivatePods
#- Path: /Users/yestin/.cocoapods/repos/zy-specs
