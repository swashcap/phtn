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

cat src/{variables,element,layout,spacing,text}.css >> dist/phtn.css

cat dist/phtn.css | node_modules/.bin/csso > dist/phtn.min.css
