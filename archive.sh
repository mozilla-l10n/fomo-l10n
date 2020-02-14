#!/usr/bin/env bash

set -euo pipefail

echo "Keep the commit hash"
touch ${TRAVIS_COMMIT}

# Selecting only a file in travis doesn't seem to work, using a dir instead
mkdir to_upload

echo "Archiving files"
tar czvf ./to_upload/translations.tgz ./dummydjangoproject/translationstests/locale ./dummydjangoproject/translationstests/networkapi/ ./${TRAVIS_COMMIT}
