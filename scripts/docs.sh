#!/bin/bash
set -exo pipefail

node_modules/.bin/kss --builder=styleguide-template \
  --css kss-assets/phtn.min.css --destination docs  --homepage ../README.md \
  --source src --title "phtn Documentation"

cp dist/phtn.min.css docs/kss-assets/

# TODO: For debugging purposes. Remove it!
echo "Docs generated:"
find docs -type f -exec echo "  {}" \;
