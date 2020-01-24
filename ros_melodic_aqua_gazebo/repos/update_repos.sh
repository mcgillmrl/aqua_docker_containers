#!/usr/bin/env bash
CURR_DIR=`pwd`
for d in $(find `pwd` -type d -name "*.hg") ; do
    cd $d
    cd ..
    echo "Updating `pwd`"
    hg pull
    hg up
done

cd $CURR_DIR
for d in $(find `pwd` -type d -name "*.git") ; do
    cd $d
    cd ..
    echo "Updating `pwd`"
    git pull
done

