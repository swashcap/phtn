#!/bin/bash
set -eo pipefail

git commit -m \
  "ci: build and docs for $(node -pe "require('./package.json').version")" \
  dist docs
git push
