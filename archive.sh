#!/usr/bin/env bash

set -euo pipefail

echo "Keep the commit hash"
touch ${TRAVIS_COMMIT}

echo "Archiving files"
tar czvf translations.tgz ./dummydjangoproject/translationstests/locale ./dummydjangoproject/translationstests/networkapi/ ${TRAVIS_COMMIT}
