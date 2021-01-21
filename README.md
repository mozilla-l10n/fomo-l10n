# Translations for foundation.mozilla.org

[![Build Status](https://github.com/mozilla-l10n/fomo-l10n/workflows/Continuous%20Integration/badge.svg)](https://github.com/mozilla-l10n/fomo-l10n/actions?query=workflow%3A%22Continuous+Integration%22)

Process foundation.mozilla.org's translations and upload them to S3.

## Contributing
Visit the following projects to contribute translations:
- https://pontoon.mozilla.org/projects/mozilla-foundation-website/
- https://pontoon.mozilla.org/projects/privacy-not-included/
- https://pontoon.mozilla.org/projects/mozilla-festival/

## Updating dependencies for this project
*Django's version must be the same as the foundation site.*
Use [pip-tools](https://github.com/jazzband/pip-tools) to update dependencies:
- Create a virtual-env: `python3 -m venv venv `
- Install pip-tools: `pip install pip-tools`
- Edit the `requirements.in` file
- Run `pip compile`
- Open a PR with both `requirements.in` and `requirements.txt`


## Enabling a new locale
- Add folders using the ab-CD format in all locations, whether it will be enabled in the .toml file or not
- Add symlinks using the ab_CD format, each pointing to the associated ab-CD folder
- Update the .toml file and add your new locale to the appropriate project(s)
- Run `inv makemessages` from the code repository
- Make sure correct plural rules (i.e not the default one) are populated in each of the new .po files, or else Wagtail is going to choke on it
