#!/bin/bash

eta_version=$(etlas exec eta -- --version | cut -d, -f2 | cut -d\  -f3 | sed s/b/./g)

if [ "${TYPE}" = "EXE" ]
then
  target=eta-aoc-day${DAY}p${PART}
  etlas build --enable-uberjar-mode ${target}
  java -Xss1024M -Xmx4096M -jar dist/build/eta-${eta_version}/eta-aoc-0.1.0.0/x/${target}/build/${target}/${target}.jar
else
  target=eta-aoc-test-day${DAY}
  etlas build --enable-uberjar-mode ${target}
  java -Xss1024M -Xmx4096M -jar dist/build/eta-${eta_version}/eta-aoc-0.1.0.0/t/${target}/build/${target}/${target}.jar --match "Part${PART}"
fi
