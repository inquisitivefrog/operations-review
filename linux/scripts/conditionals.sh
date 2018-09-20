#!/bin/bash
#set -x

if [ -z $1 ]; then
    echo enter a fruit
    read fruit
else
    fruit=$1
fi

if [ $fruit == "apple" ]; then
    echo we sometimes crave $fruit
elif [ $fruit == "orange" ]; then
    echo we really like $fruit
else 
    echo unexpected fruit: $fruit
fi
