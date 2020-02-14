#!/usr/bin/env bash

set -euo pipefail

# Keep the commit hash
touch ${TRAVIS_COMMIT}

# Selecting only a file in travis doesn't seem to work, using a dir instead
mkdir -p to_upload

echo "Archiving files"
tar -C dummydjangoproject/translationstests -czvf translations.tgz ./locale ./networkapi ../../${TRAVIS_COMMIT}
