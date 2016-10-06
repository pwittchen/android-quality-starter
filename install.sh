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
  mkdir -p config/quality
  mkdir -p config/quality/checkstyle
  mkdir -p config/quality/findbugs
  mkdir -p config/quality/lint
  mkdir -p config/quality/pmd

  msg "Downloading configuration files"
  wget https://raw.githubusercontent.com/pwittchen/android-quality-starter/master/config/quality.gradle -P ./config/
  wget https://raw.githubusercontent.com/pwittchen/android-quality-starter/master/config/quality/checkstyle/checkstyle.xml -P ./config/quality/checkstyle/
  wget https://raw.githubusercontent.com/pwittchen/android-quality-starter/master/config/quality/checkstyle/suppressions.xml -P ./config/quality/checkstyle/
  wget https://raw.githubusercontent.com/pwittchen/android-quality-starter/master/config/quality/findbugs/findbugs-filter.xml -P ./config/quality/findbugs/
  wget https://raw.githubusercontent.com/pwittchen/android-quality-starter/master/config/quality/lint/lint.xml -P ./config/quality/lint/
  wget https://raw.githubusercontent.com/pwittchen/android-quality-starter/master/config/quality/pmd/pmd-ruleset.xml -P ./config/quality/pmd/

  # TODO: append: apply from: '../config/quality.gradle' to build.gradle files in found project directories
}

main "$@" # "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}
