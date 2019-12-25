#!/bin/bash
# Should called by tar.sh, build-images.sh, cd-distribute-images.sh
# Should under the folder <project>/packages/<some-pkg>

if [ ! -f "package.json" ]; then
  echo -e "package.json not exists!"
  exit 1
fi

pkgVer=$(jq -r '.version' package.json)
pkgName=$(jq -r '.name' package.json)
pkgPrivate=$(jq -r '.private' package.json)
pkgDesc=$(jq -r '.description' package.json)

if [ -z "$pkgVer" ]; then
  echo -e "Value of version from package.json invalid!"
  exit 1
fi

if [ -z "$pkgName" ]; then
  echo -e "Value of name from package.json empty!"
  exit 1
fi

majorValue=$(echo "$pkgVer" | awk -F'.' '{print $1}')
minorValue=$(echo "$pkgVer" | awk -F'.' '{print $2}')
patchValue=$(echo "$pkgVer" | awk -F'.' '{print $3}')

# @scope/pkg => scope/pkg
pkgNameNorm=$(echo "$pkgName" | sed -r 's/[@]//g')
if [ -z "$pkgNameNorm" ]; then
  echo -e "Value of name from package.json invalid!"
  exit 1
fi

# @scope/pkg => scope-pkg
fileNameNorm=$(echo "$pkgName" | sed -r 's/[@]//g' | tr / -)
if [ -z "$fileNameNorm" ]; then
  echo -e "Value of name from package.json invalid!"
  exit 1
fi

latestVer="latest"
majorVer="$majorValue" # 2
minorVer="${majorVer}.${minorValue}"  # 2.3
patchVer="${minorVer}.${patchValue}"  # 2.3.4

# @scope/pkg => scope/pkg
imgLatest="$pkgNameNorm:$latestVer"
imgMajor="$pkgNameNorm:$majorVer"
imgMinor="$pkgNameNorm:$minorVer"
if [ -z "$CI_COMMIT_TAG" ]; then
  # rc
  imgPatch="$pkgNameNorm:rc-$CI_COMMIT_SHORT_SHA-$patchVer"
else
  # ga
  imgPatch="$pkgNameNorm:$patchVer"
fi

# specify reg server
if [ -n "$DOCKER_REG_SERVER" ]; then
  imgLatest="$DOCKER_REG_SERVER/$imgLatest"
  imgMajor="$DOCKER_REG_SERVER/$imgMajor"
  imgMinor="$DOCKER_REG_SERVER/$imgMinor"
  imgPatch="$DOCKER_REG_SERVER/$imgPatch"
fi

# scope-pkg-1.2.3
fileNameNormVer="$fileNameNorm-$patchVer"


echo -e "\$pkgName: $pkgName"
echo -e "\$pkgVer: $pkgVer"
echo -e "\$pkgNameNorm: $pkgNameNorm"
echo -e "\$fileNameNormVer: $fileNameNormVer"
echo -e "\$pkgPrivate: $pkgPrivate"
echo -e "\$pkgDesc: $pkgDesc"
echo -e "\$imgPatch: $imgPatch"

