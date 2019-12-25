#!/bin/bash
# ---------------------------
# Tar pack
#
# Used Variables:
# - TAR_COMPRESSION_LEVEL: defined in .gitlab-ci.yml
# ---------------------------
set -e

localHeadSha=$( git rev-parse HEAD )
localHeadShortSha=$( git rev-parse --short HEAD )

curDir=$(dirname $(readlink -f "$0"))
appPath=$(dirname $curDir)
outDir=assets
mkdir -p "$outDir"

TAR_COMPRESSION_LEVEL=${TAR_COMPRESSION_LEVEL:-7}
export XZ_DEFAULTS="-T 0 -$TAR_COMPRESSION_LEVEL"

cwd=`pwd`

if [ ! -f "package.json" ]; then
  exit 1
fi

echo -e "\n\n-------------------------------------------"
source "${cwd}/.scripts/pick-pkg-env.sh"
source "${cwd}/.scripts/prepare-pkg.sh"
source "${cwd}/.scripts/packing-pkg.sh"

echo -e "\n>>> Result assets:"
ls -lh $outDir

set +e

