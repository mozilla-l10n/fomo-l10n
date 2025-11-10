#!/usr/bin/env bash

set -euo pipefail

# Keep the commit hash
touch translations_github_commit_${GITHUB_SHA}

# Selecting only a file doesn't seem to work, using a dir instead
mkdir -p to_upload

find "foundation/translations" -type d | while read -r dir; do
    newdir="${dir//-/_}"

    # Only rename if the name actually changes
    if [[ "$newdir" != "$dir" ]]; then
        echo "Renaming: '$dir' -> '$newdir'"
        mv "$dir" "$newdir"
    fi
done

echo "Archiving files"
tar -C foundation/translations -cvf ./to_upload/translations.tar ./locale ./legacy_apps
tar rvf ./to_upload/translations.tar ./translations_github_commit_${GITHUB_SHA}
echo "Done!"
