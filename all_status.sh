#!/bin/bash

echo UFSCOMP $pwd

rootdir=$(pwd)

components=( "."                 \
             "cime"              \
             "components/cam"    \
             "components/cice"   \
             "components/cism"   \
             "components/clm"    \
             "components/mom"    \
             "components/mosart" \
             "components/pop"   \
             "components/ww3") 

for comp in "${components[@]}"
do
  cd $comp
  echo "====="
  echo " "$comp
  echo "====="
  git status | grep modified
  #git remote -v
  cd $rootdir
done
