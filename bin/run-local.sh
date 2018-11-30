#!/bin/bash

export TYPE=EXE

for d in {1..9}
do
  export DAY=0${d}
  for p in {1..2}
  do
    export PART=${p}
    if [ "${DAY}" == "05" ] && [ "${PART}" == "2" ]; then continue; fi
    ./bin/run.sh
  done
done

for d in {10..24}
do
  export DAY=${d}
  for p in {1..2}
  do
    export PART=${p}
    if [ "${DAY}" == "14" ] && [ "${PART}" == "1" ]; then echo "" && continue; fi
    if [ "${DAY}" == "14" ] && [ "${PART}" == "2" ]; then continue; fi
    if [ "${DAY}" == "15" ] && [ "${PART}" == "1" ]; then continue; fi
    if [ "${DAY}" == "17" ] && [ "${PART}" == "2" ]; then continue; fi
    if [ "${DAY}" == "22" ] && [ "${PART}" == "2" ]; then continue; fi
    if [ "${DAY}" == "25" ] && [ "${PART}" == "1" ]; then continue; fi
    ./bin/run.sh
  done
done

export DAY=25
export PART=1
./bin/run.sh
