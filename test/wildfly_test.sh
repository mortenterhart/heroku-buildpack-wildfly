#!/usr/bin/env bash
#
# shellcheck disable=SC1090

source "${BUILDPACK_HOME}/test/test_helper.sh"

import "wildfly"

testCreateWildflyProfileScript() {
    _create_wildfly_profile_script "${BUILD_DIR}"

    local profileScript="${BUILD_DIR}/.profile.d/wildfly.sh"

    assertTrue "WildFly .profile.d script does not exist" "[ -f '${profileScript}' ]"
    assertFileContains "export JBOSS_HOME=" "${profileScript}"
    assertFileContains "export JBOSS_CLI=" "${profileScript}"
    assertFileContains "export WILDFLY_VERSION=" "${profileScript}"
    assertFileContains "export JAVA_TOOL_OPTIONS=" "${profileScript}"
}