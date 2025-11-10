#!/usr/bin/env bash

set -euo pipefail

# Keep the commit hash
touch translations_github_commit_${GITHUB_SHA}

# Selecting only a file doesn't seem to work, using a dir instead
mkdir -p to_upload

# Recursive top-down renamer: replace '-' with '_' in directory names
rename_dirs() {
    local dir="$1"

    # Rename current directory if needed
    local newdir="${dir//-/_}"
    if [[ "$newdir" != "$dir" ]]; then
        echo "Renaming: '$dir' -> '$newdir'"
        mv "$dir" "$newdir" || return 1
        dir="$newdir"
    fi

    # Recurse into subdirectories
    for subdir in "$dir"/*/; do
        [[ -d "$subdir" ]] || continue
        rename_dirs "${subdir%/}"
    done
}

rename_dirs "foundation/translations"

echo "Archiving files"
tar -C foundation/translations -cvf ./to_upload/translations.tar ./locale ./legacy_apps
tar rvf ./to_upload/translations.tar ./translations_github_commit_${GITHUB_SHA}
echo "Done!"
