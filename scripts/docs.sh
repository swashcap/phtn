#!/bin/bash
set -exo pipefail

node_modules/.bin/kss --builder=styleguide-template \
  --css kss-assets/github.css --css kss-assets/phtn-opinions.min.css \
  --destination docs --extend styleguide-template/extend \
  --homepage ../README.md --nav-depth 2 --source src --title "phtn docs"

cp dist/phtn-opinions.min.css docs/kss-assets/
cp node_modules/highlight.js/styles/github.css docs/kss-assets/

# TODO: For debugging purposes. Remove it!
echo "Docs generated:"
find docs -type f -exec echo "  {}" \;
