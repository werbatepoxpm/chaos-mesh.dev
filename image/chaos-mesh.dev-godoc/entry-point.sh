#!/usr/bin/env bash

TARGET_BRANCH_OR_TAG="${1:-master}"

echo "target branch: $TARGET_BRANCH_OR_TAG"
echo "current directory: $(pwd)"
git clone --depth 1 --branch $TARGET_BRANCH_OR_TAG https://github.com/chaos-mesh/chaos-mesh

OUT_DIRECTORY="$(pwd)/out/$TARGET_BRANCH_OR_TAG"
mkdir -p $OUT_DIRECTORY
cd chaos-mesh && gopages -base https://chaos-mesh.dev/godoc/$TARGET_BRANCH_OR_TAG -out $OUT_DIRECTORY
