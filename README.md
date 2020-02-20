# Translations for foundation.mozilla.org

[![Build Status](https://travis-ci.org/mozilla-l10n/fomo-l10n.svg?branch=master)](https://travis-ci.org/mozilla-l10n/fomo-l10n)

Process mozilla.foundation.org's translations and upload them to S3.

## Contributing
Visit https://pontoon.mozilla.org/projects/foundation-website/ to contribute to translations.

## Updating dependencies for this project
*Django's version must be the same as the foundation site.*
Use [pip-tools](https://github.com/jazzband/pip-tools) to update dependencies:
- Create a virtual-env: `python3 -m venv venv `
- Install pip-tools: `pip install pip-tools`
- Edit the `requirements.in` file
- Run `pip compile`
- Open a PR with both `requirements.in` and `requirements.txt`
