#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app

arg1="${1:-}"


RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

date1=`date +%s`;
 while true; do
  echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
  sleep 0.1
 done
