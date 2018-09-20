#!/bin/bash
#set -x

echo $0 passed in $# args
for i in "$@"; do
    echo arg: $i
done

exit 0
