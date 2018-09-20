
Prepare for self execution
1) allow script to call shell
   $ vim ./script
   #!/bin/bash
2) set execution bit
   $ chmod u+x ./script

Add and Validate Status
1) add status
   $ vim ./script
   if [ $# == 1 ]; then
       exit 0
   else
       exit 1
   fi
2) check status
   $ chmod u+x ./script
   $ ./script
   $ echo $?


Manage arguments passed in
$0: script name
$1: 1st arg passed in
$#: total args passed in
$@: array of args passed in
$*: string of args passed in

1) test for arguments passed in
   $ vim ./script
   if [ S# == 4 ]; then
      echo this script: $0 passed in $# args
      for i in "$@"; do
          echo arg1: $i
      done
   fi
2) split input by spacing
   $ vim ./script "abc def" ghi "jkl mno" pqr stu vwx yz
   for i in $*; do
       echo $i
   done
3) don't split input 
   $ vim ./script "abc def" ghi "jkl mno" pqr stu vwx yz
   for i in "$*"; do
       echo $i
   done
