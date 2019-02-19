#!/bin/bash
set -exo pipefail

node_modules/.bin/kss --builder=styleguide-template \
  --css kss-assets/phtn.min.css --destination docs  --homepage ../README.md \
  --nav-depth 2 --source src --title "phtn docs"

cp dist/phtn.min.css docs/kss-assets/

# TODO: For debugging purposes. Remove it!
echo "Docs generated:"
find docs -type f -exec echo "  {}" \;
