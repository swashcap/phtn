#!/bin/bash
set -eo pipefail

mkdir -p dist

cat << EOF > dist/phtn.css
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

cat src/variables.css src/element.css src/layout.css src/text.css \
  src/spacing.css >> dist/phtn.css

node_modules/.bin/csso -i dist/phtn.css > dist/phtn.min.css
