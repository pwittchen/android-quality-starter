#!/usr/bin/env bash

set -e # exit on error

msg() {
    tput setab 2 # green bg
    tput setaf 7 # white text
    echo ">>> $1"
    tput sgr 0
    sleep 1
}

main() {
  msg "Creating directories"
  mkdir -pv config/quality
  mkdir -pv config/quality/checkstyle
  mkdir -pv config/quality/findbugs
  mkdir -pv config/quality/lint
  mkdir -pv config/quality/pmd

  msg "Downloading configuration files"
  REPOSITORY_PATH=https://raw.githubusercontent.com/pwittchen/android-quality-starter/master/config
  QUALITY_DIR=$REPOSITORY_PATH/quality
  wget $REPOSITORY_PATH/quality.gradle -P ./config/
  wget $QUALITY_DIR/checkstyle/checkstyle.xml -P ./config/quality/checkstyle/
  wget $QUALITY_DIR/checkstyle/suppressions.xml -P ./config/quality/checkstyle/
  wget $QUALITY_DIR/findbugs/findbugs-filter.xml -P ./config/quality/findbugs/
  wget $QUALITY_DIR/lint/lint.xml -P ./config/quality/lint/
  wget $QUALITY_DIR/pmd/pmd-ruleset.xml -P ./config/quality/pmd/

  # TODO: append: apply from: '../config/quality.gradle' to build.gradle files in found project directories
}

main "$@" # "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}
