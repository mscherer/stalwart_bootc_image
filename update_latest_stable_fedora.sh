#!/bin/bash

# found on https://discussion.fedoraproject.org/t/how-to-fetch-the-current-fedora-version-number-from-the-web/133772/4
FEDORA=$(curl -s -L https://fedoraproject.org/releases.json | jq -r '[.[].version|select(test("^[0-9]+$"))]|max')

REPO="quay.io/bootc-devel/fedora-bootc-${FEDORA}-minimal"
DIGEST=$(skopeo inspect docker://${REPO} -f '{{ .Digest }}')
echo "FROM ${REPO}@${DIGEST}" > Dockerfile.new

sed -e 1d -i Dockerfile
cat Dockerfile >> Dockerfile.new
mv -f Dockerfile.new Dockerfile

