#!/usr/bin/env bash

TARGET_BRANCH_OR_TAG="${1:-master}"

echo "target branch: $TARGET_BRANCH_OR_TAG"
echo "current directory: $(pwd)"
git clone --depth 1 --branch $TARGET_BRANCH_OR_TAG https://github.com/chaos-mesh/chaos-mesh

GIT_COMMIT=$(cd chaos-mesh && git log --pretty=format:'%h' -n 1)

OUT_DIRECTORY="$(pwd)/out/$TARGET_BRANCH_OR_TAG"
mkdir -p $OUT_DIRECTORY

crd-ref-docs --source-path=./chaos-mesh/api/v1alpha1 \
    --config=./api-reference/config.yaml \
    --renderer=asciidoctor \
    --templates-dir=./api-reference/asciidoctor \
    --output-path=out.asciidoc \
    --max-depth 1024 \
    --output-path index.asciidoc

asciidoctor -a toc2 -D $OUT_DIRECTORY -o ./index.html index.asciidoc
