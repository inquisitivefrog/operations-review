#!/bin/bash
#set -x

echo ./args_as_array.sh 1 2 3 4 5
./args_as_array.sh 1 2 3 4 5
echo ./args_as_string.sh "abc def" "ghi jkl" mno pqr "stu vw" xyz
./args_as_string.sh "abc def" "ghi jkl" mno pqr "stu vw" xyz
echo ./no_args.sh
./no_args.sh
echo ./no_args.sh hello
./no_args.sh hello

exit 0
