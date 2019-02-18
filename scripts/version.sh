#!/bin/bash
set -eo pipefail

REPLACE="s/__PHTN_VERSION__/$1/; s/__PHTN_PUBLISHED__/$2/"

# GNU sed doesn't like the BSD-style `-i` flag:
if [ "$(command -v sed)" = /bin/sed ]; then
  sed -i "$REPLACE" dist/*.css
else
  sed -i "" "$REPLACE" dist/*.css
fi

