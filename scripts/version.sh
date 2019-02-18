#!/bin/bash
set -eo pipefail

sed -i='' "s/__PHTN_VERSION__/$1/; s/__PHTN_PUBLISHED__/$2/" dist/*.css

