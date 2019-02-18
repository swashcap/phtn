#!/bin/bash
set -eo pipefail

node_modules/.bin/kss --css kss-assets/phtn.min.css --destination docs \
  --homepage ../README.md --source src

cp dist/phtn.min.css docs/kss-assets/
