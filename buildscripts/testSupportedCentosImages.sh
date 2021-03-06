#!/bin/bash -x

set -o errexit    # abort script at first error

# Setting environment variables
readonly CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

printf '%b\n' ":: Reading release config...."
source $CUR_DIR/release.sh

readonly TEST_JENKINS_VERSION=$JENKINS_VERSION
readonly TEST_JENKINS_STABLE_VERSION=$JENKINS_STABLE_VERSION

source $CUR_DIR/testImage.sh latest 8090
source $CUR_DIR/testImage.sh $TEST_JENKINS_VERSION 8100
source $CUR_DIR/testImage.sh $TEST_JENKINS_STABLE_VERSION 8110
