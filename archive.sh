#!/usr/bin/env bash

set -euo pipefail

# Keep the commit hash
touch translations_github_commit_${TRAVIS_COMMIT}

# Selecting only a file in travis doesn't seem to work, using a dir instead
mkdir -p to_upload

echo "Archiving files"
tar -C foundation/translations -cvf ./to_upload/translations.tar ./locale ./networkapi
tar rvf ./to_upload/translations.tar ./translations_github_commit_${TRAVIS_COMMIT}
echo "Done!"
