#!/bin/bash

XCPRETTYPATH=`which xcpretty`
SLATHERPATH=`which slather`

if [ -z "$XCPRETTYPATH" ]
then
  echo "Must Have XCPRETTY installed"
  exit 1
fi

if [ -z "$SLATHERPATH" ]
then
  echo "Must Have SLATH installed"
  exit 1
fi

xcodebuild \
-project devops_training.xcodeproj \
-scheme devops_training \
-enableCodeCoverage YES \
-destination 'platform=iOS Simulator,name=iPhone 8,OS=11.2' \
test | xcpretty --test --color -r junit

slather coverage -x --scheme devops_training ./devops_training.xcodeproj


