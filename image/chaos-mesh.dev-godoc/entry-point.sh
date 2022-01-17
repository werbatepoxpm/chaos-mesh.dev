#!/usr/bin/env bash

TARGET_BRANCH_OR_TAG="${1:-master}"


echo "target branch: $TARGET_BRANCH_OR_TAG"
echo "current directory: $(pwd)"
git clone --depth 1 --branch $TARGET_BRANCH_OR_TAG https://github.com/chaos-mesh/chaos-mesh

GIT_COMMIT=$(cd chaos-mesh && git log --pretty=format:'%h' -n 1)

OUT_DIRECTORY="$(pwd)/out/$TARGET_BRANCH_OR_TAG"
mkdir -p $OUT_DIRECTORY

TITLE="${TITLE:-Chaos Mesh}"
DESCRIPTION="${DESCRIPTION:-Commit ${GIT_COMMIT}. Generated at $(date).}"

cd chaos-mesh && gopages -brand-title "${TITLE}" -brand-description "${DESCRIPTION}" -google-analytics "G-7DESCBGPBX" -base https://chaos-mesh.dev/godoc/$TARGET_BRANCH_OR_TAG -out $OUT_DIRECTORY
