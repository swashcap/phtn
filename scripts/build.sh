#!/bin/bash
set -eo pipefail

mkdir -p dist

MASTHEAD=$(cat <<EOF
/**
 * phtn: A hastily composed library of utility CSS classes.
 *
 * Version: $(node -pe "require('./package.json').version")
 * Published: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
 *
 * Homepage: https://github.com/swashcap/phtn
 * License: MIT (https://github.com/swashcap/phtn/blob/master/LICENSE)
 * Author: Cory Reed (https://github.com/swashcap)
 */

EOF
)

echo "$MASTHEAD" | cat - src/variables.css src/element.css src/layout.css \
  src/text.css src/spacing.css > dist/phtn.css
echo "$MASTHEAD" | cat - src/variables.css src/opinions.css src/element.css \
  src/layout.css src/text.css src/spacing.css > dist/phtn-opinions.css

node_modules/.bin/csso -i dist/phtn.css > dist/phtn.min.css
node_modules/.bin/csso -i dist/phtn-opinions.css > dist/phtn-opinions.min.css

# csso doesn't trim trailing spaces in variable declaration
# https://github.com/css/csso/issues/393
REPLACE='s/--([^:]+): /--\1:/g'
if [ -z "$CI" ]; then
  sed -i '' -E "$REPLACE" dist/*.min.css
else
  sed --in-place -E "$REPLACE" dist/*.min.css
fi
