#!/bin/sh
set -eo pipefail

mkdir -p dist

cat << EOF > dist/phtn.css
/**
 * phtn: A hastily composed library of utility CSS classes.
 * v$(jq -r .version package.json)
 *
 * Homepage: https://github.com/swashcap/phtn
 * License: MIT (https://github.com/swashcap/phtn/blob/master/LICENSE)
 * Author: Cory Reed (https://github.com/swashcap)
 */

EOF

cat src/variables.css src/element.css src/layout.css src/text.css \
  src/spacing.css >> dist/phtn.css

node_modules/.bin/csso - dist/phtn.css > dist/phtn.min.css