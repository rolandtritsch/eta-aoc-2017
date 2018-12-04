#!/bin/bash

ETA_JAVA_ARGS="-Xss1024M -Xmx4096M"
eta_version=$(etlas exec eta -- --version | cut -d, -f2 | cut -d\  -f3 | sed s/b/./g)

if [ "${TYPE}" = "EXE" ]
then
  target=eta-aoc-day${DAY}p${PART}
  etlas build ${target} && etlas run ${target}
else
  target=eta-aoc-test-day${DAY}
  etlas build ${target} && etlas run ${target} -- --match "Part${PART}"
fi
