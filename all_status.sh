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
  #git status | grep modified
  mods=$(git status | grep modified)
  echo -e "\e[31m$mods\e[0m"
  branchname=$(git rev-parse --abbrev-ref HEAD)
  remotename=$(git remote -v | grep fetch)
  echo $branchname '::' $remotename
  cd $rootdir
done

cd cime/src/drivers/nuopc
  echo "====="
  echo " " cime/src/drivers/nuopc
  echo "====="

branchname=$(git rev-parse --abbrev-ref HEAD)
remotename=$(git remote -v | grep fetch)
mods=$(git status | grep modified)
echo -e "\e[31m$mods\e[0m"
