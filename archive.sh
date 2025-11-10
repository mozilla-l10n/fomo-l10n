#!/usr/bin/env bash

set -euo pipefail

# Keep the commit hash
touch translations_github_commit_${GITHUB_SHA}

# Selecting only a file doesn't seem to work, using a dir instead
mkdir -p to_upload

BASE_DIR="to_upload"

# Traverse directories from deepest to top to avoid rename conflicts
find "$BASE_DIR" -depth -type d | while read -r dir; do
    # Compute new directory name
    newdir="${dir//-/_}"

    # If the name changes, perform the rename
    if [[ "$newdir" != "$dir" ]]; then
        echo "Renaming: '$dir' -> '$newdir'"
        mv "$dir" "$newdir"
    fi
done

echo "Archiving files"
tar -C foundation/translations -cvf ./to_upload/translations.tar ./locale ./legacy_apps
tar rvf ./to_upload/translations.tar ./translations_github_commit_${GITHUB_SHA}
echo "Done!"
