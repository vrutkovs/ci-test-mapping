#!/bin/bash
#
# For running our test suite in CI
#

set -euo pipefail
set -x

PATH=$PATH:/go/bin

ARTIFACT_DIR=${ARTIFACT_DIR:-/tmp}

gotestsum --junitfile="${ARTIFACT_DIR}/junit.xml" --format=standard-verbose

# gotestsum doesn't set a suitename in junit's, so we add one manually
sed -i 's/\(<testsuite.*\)name=""/\1 name="ci-test-mapping"/' "${ARTIFACT_DIR}/junit.xml"
