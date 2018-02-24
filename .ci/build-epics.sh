#!/bin/bash
set -e -x

[ "$BASE" ] || exit 0

make $EXTRA

