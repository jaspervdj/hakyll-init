#!/bin/bash
set -o nounset -o errexit -o pipefail

NIGHTLY=$(curl -sI 'https://www.stackage.org/nightly' | \
        sed -n 's/Location: \///p')

stack install hakyll --resolver "$NIGHTLY"
hakyll-init my-site
cd my-site
stack init
stack build
stack exec site build
